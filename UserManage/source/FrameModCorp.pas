unit FrameModCorp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FrameBaseMod, StdCtrls, RzCmboBx, Mask, RzEdit, Buttons,
  RzSpnEdt, ExtCtrls, RzPanel, Grids, BaseGrid, AdvGrid, ComUnit;

type
  TFrame_ModCorp = class(TFrame_BaseMod)
    Grid: TAdvStringGrid;
    RzGroupBox1: TRzGroupBox;
    Btn_New: TRzRapidFireButton;
    Btn_Delete: TRzRapidFireButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edt_Title: TRzEdit;
    Cbx_Type: TRzComboBox;
    Cbx_OwnerType: TRzComboBox;
    Btn_Save: TRzRapidFireButton;
    Btn_Cancel: TRzRapidFireButton;
    procedure ChangeDataState(Sender: TObject);
    procedure NewCorp(Sender: TObject);
    procedure DelCorp(Sender: TObject);
    procedure SaveCorp(Sender: TObject);
    procedure CancelCorp(Sender: TObject);
    procedure GridRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);

  private
    { Private declarations }
    Procedure SMEDITRECORD(Var Msg:TMessage); Message SM_EDITRECORD;
    Procedure ShowDataing;
    Procedure ShowDataed;
    Function  BuildID:String;
    Procedure ClearData;
    Procedure OpenCorp(ARow:Integer);
  protected
    Procedure LoadData;  Override;
    Procedure FiltrateOperation; Override;
  public
    CurID:String;
    constructor Create(AOwner: TComponent); override;
  end;


implementation

uses DataModule;

{$R *.dfm}
Const
  ID_COL = 1;

{ TFrame_ModCorp }

function TFrame_ModCorp.BuildID: String;
Var
  NewID:String;
  I:Integer;
begin
  NewID := '1';
  for I := 1 to Grid.RowCount-1 do
  begin
    if Grid.Cols[ID_COL].IndexOf(NewID) = -1 then Break
    else  NewID := IntToStr(StrToInt(NewID)+1);
  end;
  Result := NewID;
end;

procedure TFrame_ModCorp.ClearData;
begin
  CurID := '';
  Edt_Title.Clear;
  Cbx_Type.Text := '';
  Cbx_OwnerType.Text := '';
end;

constructor TFrame_ModCorp.Create(AOwner: TComponent);
begin
  inherited;
  ShowDataing;
  ModName := mnCorp;
  MenuList := MenuList - [dsOpen];
  Grid.ColWidths[ID_COL] := 0;
  OpenCorp(1);
end;

procedure TFrame_ModCorp.FiltrateOperation;
begin
  inherited;
  Btn_New.Enabled := True;
  Btn_Delete.Enabled := DataState in [dsModify, dsLink];
  Btn_Save.Enabled := DataState in [dsNew, dsModify];
  Btn_Cancel.Enabled := DataState in [dsNew, dsModify];

  Edt_Title.Enabled := DataState <> dsEmpty;
  Cbx_Type.Enabled := Edt_Title.Enabled;
  Cbx_OwnerType.Enabled := Edt_Title.Enabled;
end;

procedure TFrame_ModCorp.LoadData;
begin
  inherited;
  DM.QueryWork('select Code, Name, Type, OwnerType from corp');
  ShowData(Grid, DM.DefQuery);
end;

procedure TFrame_ModCorp.ShowDataed;
begin
  Edt_Title.OnChange := ChangeDataState;
  Cbx_Type.OnChange := ChangeDataState;
  Cbx_OwnerType.OnChange := ChangeDataState;
end;

procedure TFrame_ModCorp.ShowDataing;
begin
  Edt_Title.OnChange := nil;
  Cbx_Type.OnChange := Nil;
  Cbx_OwnerType.OnChange := Nil;
end;

procedure TFrame_ModCorp.ChangeDataState(Sender: TObject);
begin
  inherited;
  DataState := dsModify;
end;

procedure TFrame_ModCorp.SMEDITRECORD(var Msg: TMessage);
begin
  case TDataState(Msg.WParam) of
    dsNew:NewCorp(Nil);
    dsDelete:DelCorp(nil);
    dsCancel:CancelCorp(Nil);
    dsSave:SaveCorp(Nil);
    dsOpen:OpenCorp(Grid.Row);   //
  end;
end;

procedure TFrame_ModCorp.NewCorp(Sender: TObject);
begin
  if DataState = dsNew then Exit;
  if DataState = dsModify then
      if MessageBox(Handle, '当前公司名称正在编辑中，是否要取消编辑,并新建公司名称？',
          '提示', MB_YESNO+MB_ICONASTERISK) = ID_NO then Exit;
  ShowDataing;
  ClearData;
  DataState := dsNew;
  Edt_Title.SetFocus;
end;

procedure TFrame_ModCorp.DelCorp(Sender: TObject);
Const
  SQL_DELCOM = 'Delete from Compose where JobCode = ''%s''';
  SQL_DELEMP = 'delete from EMPLOYEE where CorpCode = ''%s''';
  SQL_DELCORP = 'Delete from Corp Where Code = ''%s''';
begin
  if MessageBox(Handle, PChar('删除['+Edt_Title.Text+']公司名称，将同时删除和本公司相关的用户。'+#13+'是否要删除公司名称？'),
      '提示', MB_YESNO+MB_ICONASTERISK) = ID_NO then Exit;
  ShowDataing;
  DM.QueryWork(Format(SQL_DELCOM,[CurID]),False);
  DM.QueryWork(Format(SQL_DELEMP,[CurID]),False);
  DM.QueryWork(Format(SQL_DELCORP,[CurID]),False);
  DeleteRow(Grid, ID_COL,CurID);
  ClearData;
  Grid.AutoNumberCol(0);
  DataState := dsEmpty;
end;

procedure TFrame_ModCorp.SaveCorp(Sender: TObject);
Const
  SQL_NEW = 'insert into Corp(Code, Name, Type, OwnerType) Values(''%s'',''%s'',''%s'', ''%s'')';
  SQL_UPDATE = 'Update Corp Set Name = ''%s'', Type = ''%s'', OwnerType = ''%s'' where Code = ''%s''';
Var
  Row :Integer;
begin
  Row := -1;

  if Edt_Title.Text = '' then
  Begin
    MessageBox(Handle,'请填写公司名称!','提示',MB_OK+MB_ICONINFORMATION);
    Edt_Title.SetFocus;
    Exit;
  end;
  Grid.OnRowChanging := Nil;
  if DataState = dsNew then
  Begin
    CurID := BuildID;
    if Length(CurID) > 2 then
    Begin
      MessageBox(Handle,'公司已经饱和。不能再增加，如果要增加请于管理员联系。','提示',MB_OK+MB_ICONINFORMATION);
      ShowDataing;
      ClearData;
      DataState := dsEmpty;
      Grid.OnRowChanging := GridRowChanging;
      Exit;
    end;
    DM.QueryWork(Format(SQL_NEW,[CurID, Edt_Title.Text, Cbx_Type.Text, Cbx_OwnerType.Text]),False);
    Grid.AddRow;
    Row := Grid.RowCount-1;
    Grid.AutoNumberCol(0);
  end
  else if DataState = dsModify then
  Begin
    DM.QueryWork(Format(SQL_UPDATE,[Edt_Title.Text, Cbx_Type.Text, Cbx_OwnerType.Text, CurID]),False);
    Row := Grid.Cols[ID_COL].IndexOf(CurID);
  end;

  Grid.Cells[ID_COL,Row] := CurID;
  Grid.Cells[2,Row] := Edt_Title.Text;
  Grid.Cells[3,Row] := Cbx_Type.Text;
  Grid.Cells[4,Row] := Cbx_OwnerType.Text;

  Grid.Row := Row;
  ShowDataed;
  Grid.OnRowChanging := GridRowChanging;
  DataState := dsLink;
end;

procedure TFrame_ModCorp.CancelCorp(Sender: TObject);
Var
  Row:Integer;
begin
  if DataState in [dsNew, dsModify] then
      if MessageBox(Handle, '当前公司信息正在编辑中，是否要取消编辑？',
          '提示', MB_YESNO+MB_ICONASTERISK) = ID_NO then Exit;

  if DataState = dsNew then
  Begin
    ShowDataing;
    ClearData;
    DataState := dsEmpty;
  end
  else
  Begin
    Row := Grid.Cols[ID_COL].IndexOf(CurID);
    if Row > 0 then
    Begin
      ShowDataing;
      CurID := Grid.Cells[ID_COL,Grid.Row];
      Edt_Title.Text := Grid.Cells[2,Grid.Row];
      Cbx_Type.Text := Grid.Cells[3,Grid.Row];
      Cbx_OwnerType.Text := Grid.Cells[4,Grid.Row];
      ShowDataed;
      DataState := dsLink;
    end;
  end;
end;

procedure TFrame_ModCorp.OpenCorp(ARow:Integer);
Begin
  if Grid.Cells[ID_COL,ARow] = '' then Exit;
  if DataState in [dsNew, dsModify] then
      if MessageBox(Handle, '当前公司信息正在编辑中，是否要取消编辑打开指定公司信息？',
          '提示', MB_YESNO+MB_ICONASTERISK) = ID_NO then Exit;

  ShowDataing;
  CurID := Grid.Cells[ID_COL,ARow];
  Edt_Title.Text := Grid.Cells[2,ARow];
  Cbx_Type.Text := Grid.Cells[3,ARow];
  Cbx_OwnerType.Text := Grid.Cells[4,ARow];
  ShowDataed;
  DataState := dsLink;
end;

procedure TFrame_ModCorp.GridRowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
begin
  inherited;
  OpenCorp(NewRow);
end;

end.
