unit FrameModUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FrameBaseMod, StdCtrls, Mask, RzEdit, ComCtrls, RzListVw,
  RzTreeVw, ExtCtrls, RzPanel, RzCmboBx, Buttons, RzSpnEdt, ComUnit,
  RzBorder, ImgList;

type
  TFrame_ModUser = class(TFrame_BaseMod)
    Lst_Corp: TRzTreeView;
    Pan_Dock: TPanel;
    Btn_New: TRzRapidFireButton;
    Btn_Delete: TRzRapidFireButton;
    Btn_Save: TRzRapidFireButton;
    Btn_Cancel: TRzRapidFireButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edt_ID: TRzEdit;
    Edt_Name: TRzEdit;
    Cbx_Department: TRzComboBox;
    Cbx_Title: TRzComboBox;
    Cbx_Permission: TRzComboBox;
    RzPanel1: TRzPanel;
    Lst_User: TListView;
    RzGroupBox1: TRzGroupBox;
    Lst_Permission: TRzCheckTree;
    Lab_CorpUseList: TLabel;
    RzBorder1: TRzBorder;
    Bevel1: TBevel;
    ImageList1: TImageList;
    procedure ModUseData(Sender: TObject);
    procedure NewUser(Sender: TObject);
    procedure SaveUser(Sender: TObject);
    procedure CancelUser(Sender: TObject);
    procedure DeleteUser(Sender: TObject);
    procedure Lst_CorpDblClick(Sender: TObject);
    procedure Lst_PermissionStateChange(Sender: TObject; Node: TTreeNode;
      NewState: TRzCheckState);
    procedure Lst_CorpGetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure Lst_UserSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
  private
    FCorID: String;
    { Private declarations }
    Procedure SMEDITRECORD(Var Msg:TMessage); Message SM_EDITRECORD;
    Procedure ShowDataing;
    Procedure ShowDataed;
    Procedure ClearUser;
    Procedure ClearTreeNode(Source:TTreeNodes);
    Procedure OpenUser;
    Procedure LoadUser;
    Function  CurUserItem:TListItem;
    procedure SetCorID(const Value: String);
  protected
    Procedure LoadData;  Override;
    Procedure FiltrateOperation; Override;
  public
    ComposeList:TStrings;
    UseID:String;
    //CorID:String;

    Property  CorID:String Read FCorID Write SetCorID;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

uses DataModule, DB, ADODB;

Const
  COL_ID = 0;
  COL_NAME = 1;
  COL_DEPARTMENT = 2;
  COL_TITLE = 3;
  COL_PERMISSION = 4;
  COL_PERS = 5;
{$R *.dfm}

{ TFrame_ModUser }

procedure TFrame_ModUser.ClearUser;
Var
  I:Integer;
begin
  UseID := '';
  Edt_ID.Clear;
  Edt_Name.Clear;
  Cbx_Title.Text := '';
  Cbx_Department.Text := '';
  Cbx_Permission.Text := '';
  ComposeList.Clear;
  for I := 0 to Lst_Permission.Items.Count -1 do
    Lst_Permission.Items.Item[I].StateIndex := 1;
end;

constructor TFrame_ModUser.Create(AOwner: TComponent);
begin
  inherited;
  ShowDataing;
  ModName := mnUser;
  MenuList := MenuList - [dsOpen];
  ComposeList := TStringList.Create;
end;

procedure TFrame_ModUser.FiltrateOperation;
begin
  inherited;
  Btn_New.Enabled := True;
  Btn_Save.Enabled := DataState in [dsNew, dsModify];
  Btn_Delete.Enabled := DataState in [dsModify, dsLink];
  Btn_Cancel.Enabled := DataState in [dsNew, dsModify];
  

  Lst_Permission.Enabled := DataState <> dsEmpty;
  Edt_ID.Enabled := DataState = dsNew;
  Edt_Name.Enabled := Lst_Permission.Enabled;
  Cbx_Department.Enabled := Lst_Permission.Enabled;
  Cbx_Title.Enabled := Lst_Permission.Enabled;
  Cbx_Permission.Enabled := Lst_Permission.Enabled;
end;

procedure TFrame_ModUser.LoadData;
Const
  SQL_CORTIT = 'Select Code, Name from Corp where code in (select CorpCode from EMPLOYEE where Jobcode = ''%s'')';
  SQL_CORP = 'Select Code, Name from Corp where Code <> ''0''';
  SQL_JOBROLE = 'Select RolID, RoleName from JobRole';
  //SQL_USERCORP = 'select CorpCode from EMPLOYEE where JobCode = ''%s''';
Var
  PID:PString;
begin
  //加载公司信息
  if GIsSuperAdm then
  Begin
    DM.QueryWork(SQL_CORP);
    with DM.DefQuery do
    while Not Eof do
    begin
      New(PID);
      PID^ := Trim(Fields[0].AsString);
      Lst_Corp.Items.AddObject(Nil,Trim(Fields[1].AsString), PID);
      Next;
    end;
    Lst_Corp.Items.GetFirstNode.Selected := True;
    if Assigned(Lst_Corp.Selected) then
    Begin
      Lst_Corp.Selected.ImageIndex := 1;
      PID := Lst_Corp.Selected.Data;
      CorID := PID^;
    end;
    DM.QueryWork(SQL_JOBROLE);
  end
  else
  Begin
    Lst_Corp.Visible := False;
    Lst_Corp.Enabled := False;
    Pan_Dock.Align := alClient;
    DM.QueryWork(format(SQL_CORTIT,[GUserID]));
    if DM.DefQuery.IsEmpty then
    Begin
      DM.QueryWork('delete from EMPLOYEE where JobCode = '''+GUserID+'''',False);
      MessageBox(Handle,Pchar('工号:'+GUserID+#13+ '数据被损坏。'+#13+#13+
          '系统将自动删除此用户，并关闭本系统。'),
          '错误',MB_OK+MB_ICONERROR);
      Application.Terminate;
    end ;
    Lab_CorpUseList.Caption := '['+Trim(DM.DefQuery.Fields[1].AsString)+']公司用户信息列';  
    CorID := Trim(DM.DefQuery.Fields[0].AsString);
    DM.QueryWork(SQL_JOBROLE+' where RolID <> ''9991''');
  end;
  //加载权限列表信息。
  with DM.DefQuery do
  while Not Eof do
  begin
    New(PID);
    PID^ := Trim(Fields[0].AsString);
    Lst_Permission.Items.AddObject(Nil,Trim(Fields[1].AsString), PID);
    Next;
  end;
  //加载用户信息。
  LoadUser;
end;

procedure TFrame_ModUser.LoadUser;
Const
  SQL_SUBTERM = ' and JobCode Not In (Select JobCode from Compose where RolID = ''9991'')';
  SQL_USER = 'select JOBCODE, EMPLOYEENAME, DEPARTMENT,TITLE, PERMISSION from Employee where CorpCode = ''%s''';
  SQL_PERM = 'Select RolID, JobCode from Compose where JobCode in (%s)';
Var
  UserItem:TListItem;
  UseIDList, PermList:String;
  I:Integer;


  Procedure AddStrings(List:TStrings; Value:String);
  Begin
    Value := Trim(Value);
    if (Value <> '') and (List.IndexOf(Value) = -1) then
      List.Add(Value);
  end;
begin
  //加载用户信息
  Lst_User.Items.Clear;
  if CorID = '' then Exit;
  UseIDList := '';
  if GIsSuperAdm then
    DM.QueryWork(Format(SQL_USER,[CorID]))
  else DM.QueryWork(Format(SQL_USER+SQL_SUBTERM,[CorID]));

  with DM.DefQuery do
  while Not Eof do
  begin
    UserItem := Lst_User.Items.Add;
    UserItem.ImageIndex := 2;
    UserItem.Caption := '';
    UserItem.SubItems.Add(Trim(Fields[COL_ID].AsString));
    UserItem.SubItems.Add(Trim(Fields[COL_NAME].AsString));
    UserItem.SubItems.Add(Trim(Fields[COL_DEPARTMENT].AsString));
    UserItem.SubItems.Add(Trim(Fields[COL_TITLE].AsString));
    UserItem.SubItems.Add(Trim(Fields[COL_PERMISSION].AsString));
    UseIDList := UseIDList + ','''+Trim(Trim(Fields[COL_ID].AsString))+'''';
    Next;
  end;

  //加载用户权限信息。
  if Trim(UseIDList) <> '' then
  Begin
    Delete(UseIDList,Pos(',',UseIDList),1);
    DM.QueryWork(Format(SQL_PERM,[UseIDList]));
    with DM.DefQuery do
    Begin
      Filtered := true;
      for I := 0 to Lst_User.Items.Count -1 do
      begin
        PermList := '';
        Filter := 'JobCode='''+Lst_User.Items.Item[I].SubItems.Strings[0]+'''';
        First;
        while Not Eof do
        begin
          PermList := PermList +' '+Trim(Fields[0].AsString)+'';
          Next;
        end;
        Lst_User.Items.Item[I].SubItems.Add(PermList);
      end;
      Filtered := False;
      Filter := '';
    end;
  end;
  Cbx_Department.Items.Clear;
  Cbx_Title.Items.Clear;
  Cbx_Permission.Items.Clear;
  with Lst_User.Items do
  for I := 0 to Count -1 do
  begin
    AddStrings(Cbx_Department.Items,Item[I].SubItems.Strings[COL_DEPARTMENT]);
    AddStrings(Cbx_Title.Items,Item[I].SubItems.Strings[COL_TITLE]);
    AddStrings(Cbx_Permission.Items,Item[I].SubItems.Strings[COL_PERMISSION]);
  end;
end;

procedure TFrame_ModUser.OpenUser;
Var
  Pers:String;
  I:Integer;
  PID:PString;
begin
  if Not Assigned(Lst_User.Selected)  then Exit;
  if DataState in [dsNew, dsModify] then
  Begin
    case MessageBox(Handle, '当前用户信息真在编辑中，是否要保存用户信息。并加载打开选择的用户信息？',
        '提示', MB_YESNOCANCEL+MB_ICONASTERISK) of
      ID_YES:SaveUser(Nil);
      ID_CANCEL:Exit;
    end;
  end;
  ShowDataing;
  UseID := Lst_User.Selected.SubItems.Strings[COL_ID];
  Edt_ID.Text :=  Lst_User.Selected.SubItems.Strings[COL_ID];
  Edt_Name.Text := Lst_User.Selected.SubItems.Strings[COL_NAME];
  Cbx_Department.Text := Lst_User.Selected.SubItems.Strings[COL_DEPARTMENT];
  Cbx_Title.Text := Lst_User.Selected.SubItems.Strings[COL_TITLE];
  Cbx_Permission.Text := Lst_User.Selected.SubItems.Strings[COL_PERMISSION];
  Pers := Lst_User.Selected.SubItems.Strings[COL_PERS];
  ComposeList.Clear;
  BreakText(Pers,ComposeList);
  Lst_Permission.OnStateChange := Nil;
  for I := 0 to Lst_Permission.Items.Count -1 do
  begin
    PID:= Lst_Permission.Items.Item[I].Data;
    if Assigned(PID) then
    Begin
      if ComposeList.IndexOf(PID^) <> -1 then
        Lst_Permission.Items.Item[I].StateIndex := 2
      else Lst_Permission.Items.Item[I].StateIndex := 1;
    end;
  end;
  Lst_Permission.OnStateChange := Lst_PermissionStateChange;
  ShowDataed;
  DataState := dsLink;
end;

procedure TFrame_ModUser.ShowDataed;
begin
  Edt_ID.OnChange := ModUseData;
  Edt_Name.OnChange := ModUseData;
  Cbx_Title.OnChange := ModUseData;
  Cbx_Department.OnChange := ModUseData;
  Cbx_Permission.OnChange := ModUseData;
end;

procedure TFrame_ModUser.ShowDataing;
begin
  Edt_ID.OnChange := Nil;
  Edt_Name.OnChange := Nil;
  Cbx_Title.OnChange := Nil;
  Cbx_Department.OnChange := Nil;
  Cbx_Permission.OnChange := Nil;
end;

procedure TFrame_ModUser.SMEDITRECORD(var Msg: TMessage);
begin
  case TDataState(Msg.WParam) of
    dsNew:NewUser(Nil);
    dsDelete:DeleteUser(Nil);
    dsCancel:CancelUser(Nil);
    dsSave:SaveUser(Nil);
    dsOpen:OpenUser;
  end;
end;

procedure TFrame_ModUser.ModUseData(Sender: TObject);
begin
  if DataState <> dsNew then  DataState := dsModify;
end;

destructor TFrame_ModUser.Destroy;
begin
  ClearTreeNode(Lst_Corp.Items);
  ClearTreeNode(Lst_Permission.Items);
  ComposeList.Free;
  inherited;
end;

procedure TFrame_ModUser.ClearTreeNode(Source: TTreeNodes);
Var
  I:Integer;
begin
  with Source do
  Begin
    for I := 0 to Count-1 do
      if Assigned(Item[I].Data) then
        Dispose(Item[I].Data);
    Clear;
  end;
end;

procedure TFrame_ModUser.NewUser(Sender: TObject);
begin
  if (DataState = dsNew) or ((DataState = dsModify) and
    (MessageBox(Handle,'当前正在编辑用户信息，是否要取消编辑。进行新用户的增加工作？',
    '提示', MB_YESNO +MB_ICONASTERISK) = ID_NO)) then Exit;
  ShowDataing;
  ClearUser;
  DataState := dsNew;
  Edt_ID.SetFocus;
end;

procedure TFrame_ModUser.SaveUser(Sender: TObject);
Const
  SQL_NEW = 'insert into Employee(JOBCODE, EMPLOYEENAME, DEPARTMENT, TITLE, PERMISSION, CorpCode, PASSWORD) Values (''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'')';
  SQL_UPD = 'Update Employee Set EMPLOYEENAME = ''%s'', DEPARTMENT = ''%s'', TITLE = ''%s'', PERMISSION = ''%s'' where  JOBCODE = ''%s''';
  SQL_DELPER = 'Delete from Compose where JobCode = ''%s''';
  SQL_INTPER = 'Insert into Compose(RolID, JobCode) Values(''%s'',''%s'')';
Var
  UserItem:TListItem;
  Pers:String;
  I:Integer;
  
  Procedure ShowMsg(Msg:String);
  Begin
    MessageBox(Handle,PChar(Msg),'提示',MB_OK+MB_ICONINFORMATION);
  end;
begin
  if Trim(Edt_ID.Text) = '' then
  Begin
    ShowMsg('用户工号没有填写，请填写用户工号。');
    Edt_ID.SetFocus;
  end
  else if Trim(Edt_Name.Text) = '' then
  Begin
    ShowMsg('没有用户姓名不能进行保存，请填写用户姓名。');
    Edt_Name.SetFocus;
  end
  else if ComposeList.Count = 0 then
    ShowMsg('用户没有分配权限，请分配权限给用户')
  else
  Begin
    for I := 0 to ComposeList.Count - 1 do
      Pers := Pers +' '+ComposeList.Strings[I];
    if DataState = dsNew then
    Begin
      DM.QueryWork('select 1 from employee where JobCode = '''+Trim(Edt_ID.Text)+'''');
      if Not DM.DefQuery.IsEmpty then
      Begin
        ShowMsg('用户工号已经有人使用，请重新填写用户工号。');
        Edt_ID.Clear;
        Edt_ID.SetFocus;
        Exit;
      end;

      UseID := Trim(Edt_ID.Text);
      DM.QueryWork(Format(SQL_NEW,[UseID, Edt_Name.Text,
          Cbx_Department.Text, Cbx_Title.Text, Cbx_Permission.Text,
          CorID, UseID]),False);

      UserItem := Lst_User.Items.Add; 
      UserItem.ImageIndex := 2;
      UserItem.Caption := '';
      UserItem.SubItems.Add(Edt_ID.Text);
      UserItem.SubItems.Add(Edt_Name.Text);
      UserItem.SubItems.Add(Cbx_Department.Text);
      UserItem.SubItems.Add(Cbx_Title.Text);
      UserItem.SubItems.Add(Cbx_Permission.Text);
      UserItem.SubItems.Add(Pers);
    end
    else
    Begin
      DM.QueryWork(Format(SQL_UPD,[Edt_Name.Text,Cbx_Department.Text,
          Cbx_Title.Text, Cbx_Permission.Text, UseID]),False);

      UserItem := CurUserItem;
      if Assigned(UserItem) then
      Begin
        UserItem.SubItems.Strings[1] := Edt_Name.Text;
        UserItem.SubItems.Strings[2] := Cbx_Department.Text;
        UserItem.SubItems.Strings[3] := Cbx_Title.Text;
        UserItem.SubItems.Strings[4] := Cbx_Permission.Text;
        UserItem.SubItems.Strings[5] := Pers;
      end;
      DM.QueryWork(Format(SQL_DELPER,[UseID]),False);
    end;
    for I := 0 to ComposeList.Count - 1 do
      DM.QueryWork(Format(SQL_INTPER,[ComposeList.Strings[I],UseID]),False);
    Lst_User.OnSelectItem := NIl;
    UserItem.Selected := True;
    Lst_User.OnSelectItem := Lst_UserSelectItem;
    DataState := dsLink;
    ShowDataed;
  end;
end;

procedure TFrame_ModUser.CancelUser(Sender: TObject);
begin
  inherited;
  if MessageBox(Handle, '是否要取消当前操作？','提示', MB_YESNO+MB_ICONASTERISK) = ID_NO then Exit;
  ShowDataing;
  ClearUser;
  DataState := dsEmpty;
end;

procedure TFrame_ModUser.DeleteUser(Sender: TObject);
Const
  SQL_DELPER = 'Delete from Compose where JobCode = ''%s''';
  SQL_USER = 'Delete from employee where JobCode = ''%s''';
begin
  inherited;
  if MessageBox(Handle, '是否要删除当前用户？','提示', MB_YESNO+MB_ICONASTERISK) = ID_NO then Exit;
  DM.QueryWork(Format(SQL_DELPER,[UseID]),False);
  DM.QueryWork(Format(SQL_USER,[UseID]),False);
  Lst_User.Items.Delete(Lst_User.Items.IndexOf(CurUserItem));
  ShowDataing;
  ClearUser;
  DataState := dsEmpty;
end;

function TFrame_ModUser.CurUserItem: TListItem;
Var
  I:Integer;
begin
  Result := Nil;
  for I := 0 to Lst_User.Items.Count-1 do
  begin
    if Lst_User.Items.Item[I].SubItems.Strings[0] = UseID then
    Begin
      Result := Lst_User.Items.Item[I];
      Break;
    end;
  end;
end;

procedure TFrame_ModUser.Lst_CorpDblClick(Sender: TObject);
Var
  PID :PString;
  I:Integer;
begin
  inherited;
  if Not Assigned(Lst_Corp.Selected) then Exit;
  PID := Lst_Corp.Selected.Data;
  if CorID = PID^ then Exit;
  CorID := PID^;
  for I := 0 to Lst_Corp.Items.Count-1 do
    Lst_Corp.Items.Item[I].ImageIndex := 0;
  Lst_Corp.Selected.ImageIndex := 1;
  ShowDataing;
  ClearUser;
  LoadUser;
  DataState := dsEmpty;
end;

procedure TFrame_ModUser.SetCorID(const Value: String);
Var
  I:Integer;
  PID:PString;
begin
  if FCorID = Value then Exit;
  Lab_CorpUseList.Caption := '公司用户信息列';
  FCorID := Value;
  for I := 0 to Lst_Corp.Items.Count -1 do
  begin
    PID := Lst_Corp.Items.Item[I].Data;
    if PID^ = FCorID then
    Begin
      Lab_CorpUseList.Caption := '['+Lst_Corp.Items.Item[I].Text+']'+
          Lab_CorpUseList.Caption;
      Break;
    end;
  end;
end;

procedure TFrame_ModUser.Lst_PermissionStateChange(Sender: TObject;
  Node: TTreeNode; NewState: TRzCheckState);
Var
  Index:Integer;
  PID:PString;
begin
  inherited;
  PID := Node.Data;
  Index := ComposeList.IndexOf(PID^);
  if (NewState = csUnchecked) and (Index <> -1) then
    ComposeList.Delete(Index)
  else if (NewState = csChecked) and (Index = -1) then
    ComposeList.Add(PID^);
  if DataState <> dsNew then
    DataState := dsModify;
end;

procedure TFrame_ModUser.Lst_CorpGetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
  Node.SelectedIndex := Node.ImageIndex;
end;

procedure TFrame_ModUser.Lst_UserSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  inherited;
  if Selected then OpenUser;
end;

end.
