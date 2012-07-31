//打开主窗口快速关闭信息提示
{$define OpenFormQueryClose}

unit FormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ToolWin, ActnList, ExtCtrls, CurrUnit,Registry,

  FrameBaseView,FrameViewFlowTree, Buttons, FrameViewFlowMap, ImgList;

type
  TFrm_Main = class(TForm)
    CoolBar1: TCoolBar;
    TBar_Menu: TToolBar;
    ToolBar2: TToolBar;
    Menu_FlowWork: TMainMenu;
    N_File: TMenuItem;
    N_Query: TMenuItem;
    N_Help: TMenuItem;
    N3: TMenuItem;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    StatusBar1: TStatusBar;
    ActList_FlowOperator: TActionList;
    Act_NewFlow: TAction;
    Act_NewFlowNode: TAction;
    ActNewFlowNode1: TMenuItem;
    Splitter1: TSplitter;
    Act_DelFlow: TAction;
    Act_DelFlowNode: TAction;
    Pan_FlowTree: TPanel;
    Pan_TreeInfoBar: TPanel;
    Frame_FlowTree: TFrame_ViewFlowTree;
    Btn_MinTree: TSpeedButton;
    N1: TMenuItem;
    N6: TMenuItem;
    ActDelFlow1: TMenuItem;
    ActDelFlowNode1: TMenuItem;
    ActDelFlow2: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    Pan_Splitter: TPanel;
    SpeedButton1: TSpeedButton;
    Act_Win_ShowFlowTree: TAction;
    Act_Show_FlowTaskNodeList: TAction;
    Act_Show_FlowGlyph: TAction;
    Act_Show_TaskInfo: TAction;
    Act_Show_Part: TAction;
    Act_Show_PartUserList: TAction;
    ActWinShowFlowTree1: TMenuItem;
    Act_Win_Tools: TAction;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    Panel1: TPanel;
    ToolButton5: TToolButton;
    TBtn_FlowNode: TToolButton;
    Tbtn_LinkNodeLine: TToolButton;
    ImgL_SmlIcon_A: TImageList;
    Act_SaveFlow: TAction;
    Act_LinkTaskNode: TAction;
    FlowMap: TFrame_ViewFlowMap;
    ToolButton6: TToolButton;
    N_Employ: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    Act_EmployManage: TAction;
    Act_PartManage: TAction;
    Act_AllotPatUsers: TAction;
    N2: TMenuItem;
    procedure MinTree(Sender: TObject);
    procedure ReturnTree(Sender: TObject);
    procedure Frame_FlowTreeResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Splitter1Paint(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure ExitWorkFlow(Sender: TObject);
    procedure CloseFlow(Sender: TObject; var CanClose: Boolean);
    procedure ShowFlowTree(Sender: TObject);
    procedure Act_NewFlowExecute(Sender: TObject);
    procedure Act_NewFlowNodeExecute(Sender: TObject);
    procedure Act_LinkTaskNodeExecute(Sender: TObject);
    procedure Act_EmployManageExecute(Sender: TObject);
    procedure Act_PartManageExecute(Sender: TObject);
  private
    OperModule : TFrame_BaseView;

  public

  end;

var
  Frm_Main: TFrm_Main;

implementation

uses FrmFlowWorkWizard, FrameWorkDataList,
  FrameEditFlowWork, FrameEditOperators, FrameEditPart, FrameEditTasdNode,
  FrameTaskLinkView, FormFlowMap, FlowDM, FormFlowWorkDag, FormTaskNodeDag,
  FormEmployManage, FormPartManage;

{$R *.dfm}

{ TFrm_Main }
procedure TFrm_Main.MinTree(Sender: TObject);
begin
  Pan_FlowTree.Width := -1;
  Splitter1.Width := -1;
  Pan_Splitter.Width := 12;
end;

procedure TFrm_Main.ReturnTree(Sender: TObject);
begin
  Pan_FlowTree.Width := Pan_FlowTree.Tag;
  Splitter1.Width := Splitter1.Tag;
end;

procedure TFrm_Main.Frame_FlowTreeResize(Sender: TObject);
begin
  //定位最小按钮
  if Pan_TreeInfoBar.Width > 70 then
    Btn_MinTree.Left := Pan_TreeInfoBar.Width - 18;
end;

procedure TFrm_Main.FormShow(Sender: TObject);
begin
  {在初始化时出现OperModule.show后不能显示 OperModule现象
  这样处理后就可以显示OperModule面版}
  if OperModule <> nil then
  Begin
    OperModule.Hide;
    OperModule.Show;
  end;
end;

procedure TFrm_Main.FormDestroy(Sender: TObject);
const FLOWTREE_WIDTH = 'FlowWorkTreeWidth';
Var
  Reg:TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey(FLOW_KEY,True) then
    begin
      Reg.WriteInteger(FLOWTREE_WIDTH,Pan_FlowTree.tag);
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

procedure TFrm_Main.FormCreate(Sender: TObject);
const FLOWTREE_WIDTH = 'FlowWorkTreeWidth';
Var
  Reg:TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey(FLOW_KEY,True) then
    begin
      try
        try
          Pan_FlowTree.Tag := Reg.ReadInteger(FLOWTREE_WIDTH)
        Except
          Pan_FlowTree.Tag := 160;
        end;
      Finally
        Reg.CloseKey;
      end;
    end;
  finally
    Reg.Free;
  end;
  Pan_FlowTree.Width := Pan_FlowTree.Tag;

  { TODO : 初始化系统登录信息 }
  SysInfo.UserID := '';
  SysInfo.UserName := '陈中卫';
  
end;

procedure TFrm_Main.Splitter1Paint(Sender: TObject);
begin
  Pan_FlowTree.Tag := Pan_FlowTree.Width;
end;

procedure TFrm_Main.N1Click(Sender: TObject);
Var
  Flow:TModuleInfo;
begin
  if Frm_FlowWorkWizard = Nil then
    Application.CreateForm(TFrm_FlowWorkWizard, Frm_FlowWorkWizard);
  if Frm_FlowWorkWizard.ShowModal = ID_OK then
  Begin
    //在工作流程树中加入

    Flow := Frm_FlowWorkWizard.GetFlowInfo;
    Frame_FlowTree.SaveData(Flow);

  end;
  Frm_FlowWorkWizard.Free;
  Frm_FlowWorkWizard := Nil;
end;

procedure TFrm_Main.ExitWorkFlow(Sender: TObject);
begin
  Close;
end;

procedure TFrm_Main.CloseFlow(Sender: TObject; var CanClose: Boolean);
begin
  {$ifdef OpenFormQueryClose}
  if MessageBox(Handle,'是否要关闭[工作流]系统？',
      Pchar(Caption), MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) <> ID_YES then
    CanClose := False;
  {$endif}
end;

procedure TFrm_Main.ShowFlowTree(Sender: TObject);
begin
  Pan_FlowTree.Width := Pan_FlowTree.Tag;
  Splitter1.Width := 6;
  Pan_Splitter.Width := -1;
end;

procedure TFrm_Main.Act_NewFlowExecute(Sender: TObject);
Var
  AModule:TModuleInfo;
begin
  if Frm_Dag_FlowWork = Nil then
    Frm_Dag_FlowWork := TFrm_Dag_FlowWork.Create(self);
  with Frm_Dag_FlowWork.FlowWork do
  begin
    NewData(AModule);
    if Frm_Dag_FlowWork.ShowModal = ID_OK then
    Begin
      FlowMap.NewData(AModule);
      FlowMap.FlowTitle :=  Edt_FlowName.Text;
      FlowMap.FlowOperator := Edt_Operator.Text;
      FlowMap.FlowCreateDate := Edt_CreateDate.Text;
      FlowMap.FlowType := Comb_FlowType.Text;
      FlowMap.FlowDescription := Mem_FlowDes.Text;
      FlowMap.FlowVer := FlowVer;
    end;
  end;
  Frm_Dag_FlowWork.Free;
  Frm_Dag_FlowWork := Nil;
end;

procedure TFrm_Main.Act_NewFlowNodeExecute(Sender: TObject);
Var
  AFlowData:TModuleInfo;
begin
  if Frm_Dag_TaskNode = Nil then
    Frm_Dag_TaskNode := TFrm_Dag_TaskNode.Create(self);
  try
    with Frm_Dag_TaskNode do
    Begin
      TaskNode.NewData(AFlowData);
      if ShowModal = ID_OK then
        FlowMap.AddFlowNodePoint(TaskNode.TaskNodeInfo);
    end;
  Finally
    Frm_Dag_TaskNode.Free;
    Frm_Dag_TaskNode := Nil;
  end;
end;

procedure TFrm_Main.Act_LinkTaskNodeExecute(Sender: TObject);
begin
  FlowMap.Ldd_LinkNode.Activate(Nil);
end;

procedure TFrm_Main.Act_EmployManageExecute(Sender: TObject);
begin
  if Frm_ManageEmploy = Nil then
    Frm_ManageEmploy := TFrm_ManageEmploy.Create(Self);
  try
    Frm_ManageEmploy.ShowModal;
  finally
    Frm_ManageEmploy.Free;
    Frm_ManageEmploy := Nil;
  end;
end;

procedure TFrm_Main.Act_PartManageExecute(Sender: TObject);
begin
  if Frm_ManagePart = Nil then
    Frm_ManagePart := TFrm_ManagePart.Create(Self);
  try
    Frm_ManagePart.ShowModal;
  finally
    Frm_ManagePart.Free;
    Frm_ManagePart := Nil;
  end;
end;

end.
