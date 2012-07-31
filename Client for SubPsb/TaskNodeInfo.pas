unit TaskNodeInfo;

interface

Uses
  Classes,ComCtrls, CurrUnit , SysUtils;

///////////////////////////////////////////////
//  用户信息 Useinfo
//----------------------------
//  [角色（工号）]
//    姓名    = （姓名）
//    部门    = （部门）
//    职称    = （职称）
//    密码    = （密码） //加密
//    权限    = （权限）

type
  TUserInfo = ^TOperator;
  TOperator = record
    JobID:String;
    Name:String;
    Department:String;
    Title :String;
    Password:String;
    Permission:String;
  end;


type
  TPartInfo = class(TPersistent)
  private
    FTitle: String;
    FDescribe: String;
    FUserList: TList;
    function GetUserInfo(index: Integer): TUserInfo;
    procedure SetUserInfo(index: Integer; const Value: TUserInfo);
    function GetUserCount: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    Property  Title:String Read FTitle Write FTitle;
    Property  Describe:String Read FDescribe Write FDescribe;
    Procedure AssignUser(AListItems:TListItems);
    Procedure AssignUsersTo(AListItems:TListItems);
    Procedure DeleteUser(Index:Integer); overload;
    Procedure DeleteUser(AListItem:TListItem); overload;
    Procedure DeleteUser(AUserInfo:TUserInfo); overload;
    Procedure AddUser(AListItem:TListItem);
    property  UserItems[index:Integer]:TUserInfo read GetUserInfo write SetUserInfo;
    Property  UserCount:Integer read GetUserCount;
    procedure Assign(Source: TPersistent); Override;
  end;


//////////////////////////////////////////////////////////////////
//  [(任务名称)]
//    考核时间              = （考核时间）
//    任务主题              = （任务主题）
//    工作角色              = （工作角色名称）
//    位图信息              = (left,top,width,height) //用","分割
//    子任务（流水号）      = （子任务名称）
//    ...
  TTaskNodeInfo = class(TPersistent)
  private
    FSetDate: Integer;
    FTitle: String;

    FChildTask: TList;
    FDescribe: String;
    FPartInfo: TPartInfo;
    procedure SetPartInfo(const Value: TPartInfo);
    function GetChildTask(Index: Integer): TStrings;
    procedure SetChildTask(Index: Integer; const Value: TStrings);
    procedure SetTitle(const Value: String);
  public
    constructor Create;
    destructor Destroy; override;
    Property  Title:String read FTitle write SetTitle;
    Property  SetDate:Integer read FSetDate write FSetDate;
    Property  Describe:String Read FDescribe Write FDescribe;
    Property  Part:TPartInfo Read FPartInfo Write SetPartInfo;
    Procedure AddChildTask(AChildTask:TStrings);
    Procedure DeleteChildTask(AChildTask:TStrings);
    Property  ChildTaskItem[Index:Integer]:TStrings Read GetChildTask Write SetChildTask;
    Procedure Assign(Source: TPersistent); override;
    Function ChildTaskCount:Integer;
  end;

Function UserInfoToListItem(AStrings:TUserInfo;AListItem:TListItem):Boolean;
Function ListItemToUserInfo(AListItem:TListItem;AUserInfo:TUserInfo):Boolean;

implementation

Function UserInfoToListItem(AStrings:TUserInfo;AListItem:TListItem):Boolean;
Begin
  try
    AListItem.Caption := AStrings.Name;
    AListItem.SubItems.Clear;
    AListItem.SubItems.Add(AStrings.JobID);
    AListItem.SubItems.Add(AStrings.Department);
    AListItem.SubItems.Add(AStrings.Title);
    AListItem.SubItems.Add(AStrings.Permission);
    AListItem.SubItems.Add(AStrings.Password);
    Result := True;
  except
    Result := False;
  end;
end;

Function ListItemToUserInfo(AListItem:TListItem;AUserInfo:TUserInfo):Boolean;
Begin
  try
    AUserInfo.Name := Trim(AListItem.Caption);
    AUserInfo.JobID := Trim(AListItem.SubItems.Strings[0]);
    AUserInfo.Department := Trim(AListItem.SubItems.Strings[1]);
    AUserInfo.Title := Trim(AListItem.SubItems.Strings[2]);
    AUserInfo.Permission := Trim(AListItem.SubItems.Strings[3]);
    AUserInfo.Password := Trim(AListItem.SubItems.Strings[4]);
    Result := True;
  except
    Result := False;
  end;
end;

{ TTaskNodeInfo }
procedure TTaskNodeInfo.AddChildTask(AChildTask: TStrings);
Var
  CTask:TStrings;
begin
  CTask := TStringList.Create;
  try
    CTask.Assign(AChildTask);
    FChildTask.Add(CTask);
  except
    CTask.Free;
  end;
end;

procedure TTaskNodeInfo.Assign(Source: TPersistent);
Var
  I:Integer;
  CTask:TStrings;
  ATaskNode:TTaskNodeInfo;
begin
  //inherited Assign(Source);
  //if Not (Source is TTaskNodeInfo) then Exit;
  ATaskNode := TTaskNodeInfo(Source);
  SetDate := ATaskNode.SetDate;
  Title := ATaskNode.Title;
  Describe := ATaskNode.Describe;
  Part.Assign(ATaskNode.Part);
  for I := 1 to ATaskNode.ChildTaskCount -1 do
  begin
    CTask := TStringList.Create;
    try
      CTask.Assign(ATaskNode.ChildTaskItem[I]);
      AddChildTask(CTask);
    Except
      CTask.Free;
    end;
  end;
end;

function TTaskNodeInfo.ChildTaskCount: Integer;
begin
  Result := FChildTask.Count;
end;

constructor TTaskNodeInfo.Create;
begin
  inherited Create;
  FSetDate := 0;
  FTitle := '';
  FPartInfo := TPartInfo.Create;
  FChildTask := TList.Create;
end;

procedure TTaskNodeInfo.DeleteChildTask(AChildTask: TStrings);
Var
  Index:Integer;
begin
  Index := FChildTask.IndexOf(AChildTask);
  if Index <> -1 then
  Begin
    FChildTask.Delete(Index);
    FChildTask.Pack;
  end;
end;

destructor TTaskNodeInfo.Destroy;
begin
  FChildTask.Free;
  FPartInfo.Free;
  inherited Destroy;
end;

function TTaskNodeInfo.GetChildTask(Index: Integer): TStrings;
begin
  Result := FChildTask.Items[Index];
end;

procedure TTaskNodeInfo.SetChildTask(Index: Integer; const Value: TStrings);
begin
  FChildTask.Items[Index] := Value;
end;

procedure TTaskNodeInfo.SetPartInfo(const Value: TPartInfo);
begin
  FPartInfo.Assign(Value);
end;

procedure TTaskNodeInfo.SetTitle(const Value: String);
begin
  FTitle := Value;
end;

{ TPartInfo }

procedure TPartInfo.AddUser(AListItem: TListItem);
Var
  Employ:TUserInfo;
begin
  New(Employ);
  try
    ListItemToUserInfo(AListItem,Employ);
    FUserList.Add(Employ);
  finally
    Dispose(Employ);
  end;
end;

procedure TPartInfo.Assign(Source: TPersistent);
Var
  I:Integer;
  PartInfo:TPartInfo;
  Employ:TUserInfo;
begin
  //inherited assign(Source);
  PartInfo := TPartInfo(Source);
  FTitle := PartInfo.Title;
  Describe:= PartInfo.Describe;
  FUserList.Clear;
  FUserList.Pack;
  for I := 0 to PartInfo.UserCount -1 do
  begin
    New(Employ);
    try
      Employ.JobID := PartInfo.UserItems[I].JobID;
      Employ.Name := PartInfo.UserItems[I].Name;
      Employ.Department := PartInfo.UserItems[I].Department;
      Employ.Title := PartInfo.UserItems[I].Title;
      Employ.Password := PartInfo.UserItems[I].Password;
      Employ.Permission := PartInfo.UserItems[I].Permission;
      FUserList.Add(Employ);
    except
      Dispose(Employ);
    end;
  end;
end;

procedure TPartInfo.AssignUser(AListItems: TListItems);
Var
  I:Integer;
begin
  FUserList.Clear;
  for I := 0 to AListItems.Count -1 do
    AddUser(AListItems.Item[I]);
end;

procedure TPartInfo.AssignUsersTo(AListItems: TListItems);
Var
  I:Integer;
  Employ:TListItem;
begin
  AListItems.Clear;
  for I := 0 to self.UserCount -1 do
  begin
    Employ := AListItems.Add;
    UserInfoToListItem(UserItems[I],Employ);
  end;
end;

constructor TPartInfo.Create;
begin
  FUserList := TList.Create;
end;

procedure TPartInfo.DeleteUser(Index: Integer);
begin
   if Index<>-1 then
   begin
      FUserList.Delete(Index);
      FUserList.Pack;
   end;
end;

procedure TPartInfo.DeleteUser(AListItem: TListItem);
Var
  AUserInfo:TUserInfo;
  I:integer;
begin
  New(AUserInfo);
  try
    I:=FUserList.IndexOf(AUserInfo);
    if I<>-1 then
    begin
      FUserList.Delete(I);
      FUserList.Pack;
    end;
  finally
    Dispose(AUserInfo);
  end;
end;

procedure TPartInfo.DeleteUser(AUserInfo: TUserInfo);
Var
  I:Integer;
begin
  I:=FUserList.IndexOf(AUserInfo);
  if I<>-1 then
  begin
    FUserList.Delete(I);
    FUserList.Pack;
  end;
end;

destructor TPartInfo.Destroy;
begin
  FUserList.Free;
  inherited Destroy;
end;

function TPartInfo.GetUserCount: Integer;
begin
  Result := FUserList.Count;
end;

function TPartInfo.GetUserInfo(index: Integer): TUserInfo;
begin
  Result:= FUserList[Index];
end;

procedure TPartInfo.SetUserInfo(index: Integer; const Value: TUserInfo);
begin
  FUserList[Index] := Value;
end;

end.
