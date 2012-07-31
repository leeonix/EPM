unit FrameModJobRole;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FrameBaseMod, StdCtrls, RzEdit, Buttons, RzSpnEdt, Mask,
  ExtCtrls, RzPanel, Grids, BaseGrid, AdvGrid, ComUnit;

type
  {
  TJobRole = record
    ID:String;
    Title:String;
    Memo:String;
  end;
   }
  TFrame_ModJobRole = class(TFrame_BaseMod)
    Grid: TAdvStringGrid;
    RzGroupBox1: TRzGroupBox;
    Label1: TLabel;
    Edt_Title: TRzEdit;
    Btn_New: TRzRapidFireButton;
    Btn_Delete: TRzRapidFireButton;
    Btn_Save: TRzRapidFireButton;
    RzGroupBox2: TRzGroupBox;
    Meo_Des: TRzMemo;
    Btn_Cancel: TRzRapidFireButton;
    procedure NewCorp(Sender: TObject);
    procedure OpenCorp(Sender: TObject);
    procedure SaveCorp(Sender: TObject);
    procedure DelCorp(Sender: TObject);
    procedure CancelCorp(Sender: TObject);
    procedure Edt_TitleChange(Sender: TObject);
    procedure GridDblClickCell(Sender: TObject; ARow, ACol: Integer);
  private
    { Private declarations }
    Procedure SMEDITRECORD(Var Msg:TMessage); Message SM_EDITRECORD;
    Procedure ShowDataing;
    Procedure ShowDataed;
    Function  BuildID:String;
    Procedure ClearData;
  protected
    Procedure LoadData;  Override;
    Procedure FiltrateOperation; Override;
  public
    CurID:String;
    constructor Create(AOwner: TComponent); override;
  end;


implementation

uses DataModule;

Const
  ID_COL = 1;

{$R *.dfm}

{ TFrame_ModJobRole }

constructor TFrame_ModJobRole.Create(AOwner: TComponent);
begin
  inherited;
  ShowDataing;
  ModName := mnJobRole;
  Grid.ColWidths[ID_COL] := 0;
end;

procedure TFrame_ModJobRole.LoadData;
begin
  DM.QueryWork('Select RolID, RoleName, RoleDes from JobRole Where Not RolID in (''9991'',''9992'')');
  ShowData(Grid,DM.DefQuery);
end;

procedure TFrame_ModJobRole.SMEDITRECORD(var Msg: TMessage);
begin
  case TDataState(Msg.WParam) of
    dsNew:NewCorp(Nil);
    dsDelete:DelCorp(nil);
    dsCancel:CancelCorp(Nil);
    dsSave:SaveCorp(Nil);
    dsOpen:OpenCorp(nil);
  end;
end;

procedure TFrame_ModJobRole.NewCorp(Sender: TObject);
begin
  if DataState = dsNew then Exit;
  if DataState = dsModify then
      if MessageBox(Handle, '当前角色正在编辑中，是否要取消编辑,并新建角色？',
          '提示', MB_YESNO+MB_ICONASTERISK) = ID_NO then Exit;
  ShowDataing;
  ClearData;
  DataState := dsNew;
  Edt_Title.SetFocus;
end;

procedure TFrame_ModJobRole.OpenCorp(Sender: TObject);
begin
  if Grid.Cells[ID_COL,Grid.Row] = '' then Exit;
  if DataState in [dsNew, dsModify] then
      if MessageBox(Handle, '当前角色正在编辑中，是否要取消编辑打开指定角色？',
          '提示', MB_YESNO+MB_ICONASTERISK) = ID_NO then Exit;
          
  ShowDataing;
  CurID := Grid.Cells[ID_COL,Grid.Row];
  Edt_Title.Text := Grid.Cells[2,Grid.Row];
  Meo_Des.Text := Grid.Cells[3,Grid.Row];
  ShowDataed;
  DataState := dsLink;
end;

procedure TFrame_ModJobRole.SaveCorp(Sender: TObject);
Const
  SQL_UPDATE = 'Update JobRole Set RoleName = ''%s'', RoleDes  = ''%s'' where RolID = ''%s''';
  SQL_NEW = 'insert into JobRole(RolID, RoleName, RoleDes) Values(''%s'',''%s'',''%s'')';
Var
  Row:Integer;
begin
  if DataState = dsNew then
  Begin
    CurID := BuildID;
    DM.QueryWork(Format(SQL_NEW,[CurID, Edt_Title.Text, Meo_Des.Text]),False);
  end
  else if DataState = dsModify then
    DM.QueryWork(Format(SQL_UPDATE,[Edt_Title.Text, Meo_Des.Text, CurID]),False);

  Row := Grid.Cols[ID_COL].IndexOf(CurID);
  if Row = -1 then
  Begin
    Grid.AddRow;
    Row := Grid.RowCount-1;
    Grid.AutoNumberCol(0);
  end;
  Grid.Cells[ID_COL,Row] := CurID;
  Grid.Cells[2,Row] := Edt_Title.Text;
  Grid.Cells[3,Row] := Meo_Des.Text;
  Grid.Row := Row;
  ShowDataed;
  DataState := dsLink;
end;

procedure TFrame_ModJobRole.DelCorp(Sender: TObject);
Const
  TNR_SQL = 'select Count(1) from TASKNODE where RolID = ''%s''';
begin
  DM.QueryWork(Format(TNR_SQL,[CurID]));
  if DM.DefQuery.Fields[0].AsInteger > 0 then
    MessageBox(Handle,'当前角色在节点管理中已经应用。不能删除当前角色。','提示', MB_OK+MB_ICONINFORMATION)
  else
  Begin
    if MessageBox(Handle,Pchar('删除当前角色，将同时删除用户所关联的本角色。'+#13+'是否要删除当前角色？')
        ,'提示', MB_YESNO+MB_ICONASTERISK) = ID_NO then Exit;
    ShowDataing;
    DM.QueryWork('Delete from COMPOSE where RolID = '''+CurID+'''', False);
    DM.QueryWork('Delete from JobRole where RolID = '''+CurID+'''', False);
    DeleteRow(Grid, ID_COL,CurID);
    Grid.AutoNumberCol(0);
    ClearData;
    DataState := dsEmpty;
  end;
end;

procedure TFrame_ModJobRole.CancelCorp(Sender: TObject);
Var
  Row:Integer;
begin
  if DataState in [dsNew, dsModify] then
      if MessageBox(Handle, '当前角色正在编辑中，是否要取消编辑？',
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
      Meo_Des.Text := Grid.Cells[3,Grid.Row];
      ShowDataed;
      DataState := dsLink;
    end;
  end;
end;

procedure TFrame_ModJobRole.ClearData;
begin
   CurID := '';
   Edt_Title.Clear;
   Meo_Des.Clear;
end;

procedure TFrame_ModJobRole.FiltrateOperation;
begin
  inherited;
  Btn_New.Enabled := True;
  Btn_Delete.Enabled := DataState in [dsModify,dsLink];
  Btn_Save.Enabled := DataState in [dsNew, dsModify];
  Btn_Cancel.Enabled := DataState in [dsNew, dsModify];

  Edt_Title.Enabled := DataState <> dsEmpty;
  Meo_Des.ReadOnly :=  DataState = dsEmpty;
end;

Function TFrame_ModJobRole.BuildID:String;
Var
  NewID:String;
  I, Y:Integer;
begin
  NewID := '0001';
  for I := 1 to Grid.RowCount-1 do
  begin
    if Grid.Cols[ID_COL].IndexOf(NewID) = -1 then
      Break
    else
    Begin
      NewID := IntToStr(StrToInt(NewID)+1);
      for Y := 1 to 4 - Length(NewID) do
        NewID := '0'+NewID;
    end;
  end;
  Result := NewID;
end;

procedure TFrame_ModJobRole.ShowDataed;
begin
  Edt_Title.OnChange := Edt_TitleChange;
  Meo_Des.OnChange := Edt_TitleChange;
end;

procedure TFrame_ModJobRole.ShowDataing;
begin
  Edt_Title.OnChange := Nil;
  Meo_Des.OnChange := Nil;
end;

procedure TFrame_ModJobRole.Edt_TitleChange(Sender: TObject);
begin
  DataState := dsModify;
end;

procedure TFrame_ModJobRole.GridDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  inherited;
  OpenCorp(Nil);
end;

end.
