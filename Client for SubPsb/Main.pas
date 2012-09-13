{****************************************************************************
       项目名称:  闵行供电公司供配电工程信息管理系统
      客户名称:  上海电力公司闵行供电分公司
    Copyright (c) 2001-? Shanghai Dawning Software Corporation
****************************************************************************}

unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,IniFiles,
  ComCtrls, ToolWin, Menus, ActnList, StdCtrls, CheckLst, ExtCtrls,treefram,
  Buttons, ImgList, OleCtrls,browser,prjbrowser,pubvar,searchtree,Dm,
  StdActns,FmxUtils, TreeListPrj;

 //The message used to close left panel tree        like delegate in dotnet.
const  Wm_closeleft=WM_user+2;

type
  TFrm_Main = class(TForm)
    stbmain: TStatusBar;
    CoolBar1: TCoolBar;
    Tbr_Menu: TToolBar;
    Tbr_Tool: TToolBar;
    Tbr_Navgitor: TToolBar;
    Label1: TLabel;
    Mn_Main: TMainMenu;
    ActionList1: TActionList;
    Panel1: TPanel;
    F1: TMenuItem;
    mnt_new: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    D1: TMenuItem;                      //
    Q1: TMenuItem;
    R1: TMenuItem;
    H1: TMenuItem;
    N5: TMenuItem;
    A1: TMenuItem;
    C1: TMenuItem;
    N6: TMenuItem;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    tbtnprj: TToolButton;
    ToolButton14: TToolButton;
    Tm_System: TTimer;
    ToolButton11: TToolButton;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N23: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N30: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N36: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    N35: TMenuItem;
    N39: TMenuItem;
    N40: TMenuItem;
    ToolButton3: TToolButton;
    ToolButton16: TToolButton;
    N45: TMenuItem;
    Splitter1: TSplitter;
    Imglst_Tools: TImageList;
    Asettree: TAction;
    N46: TMenuItem;
    N47: TMenuItem;
    N48: TMenuItem;
    N49: TMenuItem;
    N50: TMenuItem;
    N51: TMenuItem;
    N52: TMenuItem;
    N53: TMenuItem;
    N54: TMenuItem;
    N55: TMenuItem;
    N56: TMenuItem;
    N57: TMenuItem;
    ToolButton13: TToolButton;
    mnutasktree: TMenuItem;
    mnubrowser: TMenuItem;
    N63: TMenuItem;
    N64: TMenuItem;
    mnusearch: TMenuItem;
    tbtntask: TToolButton;
    newdg: TAction;
    quit: TAction;
    about: TAction;
    Ahlp: TAction;
    Cbx_Nav: TComboBoxEx;
    tbtnsearch: TToolButton;
    ToolButton10: TToolButton;
    ToolButton17: TToolButton;
    Imglst_Task: TImageList;
    Amodpwd: TAction;
    Asetflow: TAction;
    Asetuser: TAction;
    ToolButton12: TToolButton;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    newgx: TAction;
    newsb: TAction;
    newprj: TAction;
    Asendprj: TAction;
    Aviewnode: TAction;
    Arefresh: TAction;
    Aupnode: TAction;
    Pnl_right: TPanel;
    Splitter2: TSplitter;
    Pmn_Task: TPopupMenu;
    Pmnitem_send: TMenuItem;
    ToolButton18: TToolButton;
    Relogin: TAction;
    N28: TMenuItem;
    clearrecycle: TAction;
    delete: TAction;
    N41: TMenuItem;
    N42: TMenuItem;
    return: TAction;
    Pause: TAction;
    N43: TMenuItem;
    RepManage: TAction;
    N20: TMenuItem;
    Pmnitem_del: TMenuItem;
    Pmnitem_cleardel: TMenuItem;
    Pmnitem_return: TMenuItem;
    Pmnitem_pause: TMenuItem;
    reactive: TAction;
    N62: TMenuItem;
    N65: TMenuItem;
    N66: TMenuItem;
    N67: TMenuItem;
    Pmnitem_react: TMenuItem;
    N69: TMenuItem;
    N1: TMenuItem;
    N21: TMenuItem;
    newyg: TAction;
    N25: TMenuItem;
    Imglst_Larg: TImageList;
    N18: TMenuItem;
    A_SearchInterprj: TAction;
    A_advanceSearch: TAction;
    ToolButton15: TToolButton;
    N17: TMenuItem;
    Archprj: TAction;
    Pmnitem_arc: TMenuItem;
    N19: TMenuItem;
    newsubprj: TAction;
    newsubprj1: TMenuItem;
    Awtdesign: TAction;
    N22: TMenuItem;
    PmnItem_Wtdesign: TMenuItem;
    Asetmat: TAction;
    N24: TMenuItem;
    N44: TMenuItem;
    DisusePrj: TAction;
    Pmnitem_Disuse: TMenuItem;
    Newky: TAction;
    N58: TMenuItem;
    Lsv_Task: TListView;
    Apubsoft: TAction;
    Apubsoft1: TMenuItem;
    DesignMod: TAction;
    N59: TMenuItem;
    N60: TMenuItem;
    newld: TAction;
    newpfm: TAction;
    newmg: TAction;
    SpeedButton1: TSpeedButton;
    Pmnitem_Hide: TMenuItem;
    NewDesginPrj: TAction;
    N3: TMenuItem;
    N68: TMenuItem;
    N70: TMenuItem;
    N71: TMenuItem;
    N29: TMenuItem;
    ToolButton20: TToolButton;
    N31: TMenuItem;
    N72: TMenuItem;
    N61: TMenuItem;
    N73: TMenuItem;
    N74: TMenuItem;
    N76: TMenuItem;
    N75: TMenuItem;
    procedure Tbr_NavgitorResize(Sender: TObject);
    procedure tbtnnavClick(Sender: TObject);
    procedure quitExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure mnutasktreeClick(Sender: TObject);
    procedure tbtntaskClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Lsv_TaskColumnClick(Sender: TObject; Column: TListColumn);
    procedure Lsv_TaskCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure AhlpExecute(Sender: TObject);
    procedure aboutExecute(Sender: TObject);
    procedure newgxExecute(Sender: TObject);
    procedure newdgExecute(Sender: TObject);
    procedure AsendprjExecute(Sender: TObject);
    //procedure newprjExecute(Sender: TObject);
    procedure Lsv_TaskDblClick(Sender: TObject);
    procedure ArefreshExecute(Sender: TObject);
    procedure Tm_SystemTimer(Sender: TObject);
    procedure N51Click(Sender: TObject);
    procedure N52Click(Sender: TObject);
    procedure N53Click(Sender: TObject);
    procedure N54Click(Sender: TObject);
    procedure Cbx_NavChange(Sender: TObject);
    procedure AsetflowExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure newsbExecute(Sender: TObject);
    procedure reloginExecute(Sender: TObject);
    procedure clearrecycleExecute(Sender: TObject);
    procedure deleteExecute(Sender: TObject);
    procedure returnExecute(Sender: TObject);
    procedure PauseExecute(Sender: TObject);
    procedure reactiveExecute(Sender: TObject);
    procedure RepManageExecute(Sender: TObject);
    procedure newygExecute(Sender: TObject);
    procedure mnunavigatorClick(Sender: TObject);
    procedure A_advanceSearchExecute(Sender: TObject);
    procedure A_SearchInterprjExecute(Sender: TObject);
    procedure AmodpwdExecute(Sender: TObject);
    procedure ArchprjExecute(Sender: TObject);
    procedure newsubprjExecute(Sender: TObject);
    procedure AwtdesignExecute(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure AsetmatExecute(Sender: TObject);
    procedure N44Click(Sender: TObject);
    procedure DisusePrjExecute(Sender: TObject);
    procedure NewkyExecute(Sender: TObject);
    procedure DesignModExecute(Sender: TObject);
    procedure ToolButton19Click(Sender: TObject);
    procedure newldExecute(Sender: TObject);
    procedure newpfmExecute(Sender: TObject);
    procedure newmgExecute(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Pmnitem_HideClick(Sender: TObject);
    procedure NewDesginPrjExecute(Sender: TObject);
    procedure N71Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure AsetuserExecute(Sender: TObject);
    procedure N29Click(Sender: TObject);
    procedure ToolButton20Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N72Click(Sender: TObject);
    procedure N61Click(Sender: TObject);
    procedure N73Click(Sender: TObject);
    procedure N74Click(Sender: TObject);
    procedure N76Click(Sender: TObject);

  private
    { Private declarations }
    function  ShowTree(const Tag:Integer):Boolean;              //显示目标树视图
    procedure CloseLeft(var Msg:Tmessage);message Wm_closeleft; //响应关闭视图消息
    procedure UpdateTreelistCol;
    procedure Expandchild(Targetfram: Tframe);
    procedure ArcFindPrj();

  public
    { Public declarations }
    Fram_Browser:TFram_Browser;
    procedure  Dopermission;
    procedure  ShowDetailInfo(const FocusTag:Integer);
    procedure  ShowWebBrower;
    procedure  ShowRecyclePrj;
    procedure  ShowDisUsePrj;
    procedure  ShowTaskByType;
    procedure  ShowPausePrj;
    procedure  ShowWtDesign;
    procedure  ShowFindResult;
    procedure  ShowTaskOveriew(Node:TTreeNode);
    procedure  ShowPrjList(aType:string);
    procedure  Updatecolumns;
    procedure  UpdateNavCol();
    procedure  AddLsvColumn (ColCap:TStringlist; Imgindex:integer=-1);
    procedure  AddTasklist(const Atype:string;Node:TtreeNode);
  end;

var
  Frm_Main: TFrm_Main;

implementation

uses NewItem,Flowcontrol,ReportManag,Prj_Design, Search, setpwd, frm_sgdw, Setparam,
     Sumcondition,Udelayprj,DelayContract, UfrmGetfee, tasktree, DB,Login, Sjimport,Gspfimport,
     importbudget, frm_exportcontractlist,importwtdesign,JsReport;

{$R *.DFM}


var  columnToSort:Integer;

procedure TFrm_Main.Tbr_NavgitorResize(Sender: TObject);
begin
  Cbx_Nav.Width:=Tbr_Navgitor.Width-80;

end;

procedure TFrm_Main.tbtnnavClick(Sender: TObject);
begin
  ShowTree((Sender as Ttoolbutton).Tag);
end;


procedure TFrm_Main.quitExecute(Sender: TObject);

begin
   close;
end;

procedure TFrm_Main.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   if MessageBox(self.Handle, '您确定要退出工程信息系统吗？','Easy Project'
                                ,MB_YESNO+MB_ICONINFORMATION)<>IdYes then
      Canclose := False;
end;

procedure TFrm_Main.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if (key=#13) and (not(ActiveControl is TRichEdit)
      or not(ActiveControl is TMemo)) then
   SelectNext(ActiveControl,True,True);
end;



procedure TFrm_Main.mnutasktreeClick(Sender: TObject);
begin
   ShowTree(TMenuItem(Sender).Tag);
end;

procedure TFrm_Main.tbtntaskClick(Sender: TObject);
begin
  ShowTree((Sender as Ttoolbutton).Tag);
end;

//根据用户的选择,切换或显示相应的导航视图
function TFrm_Main.ShowTree(const Tag:Integer): boolean;
begin
   case tag of
     TaskView:
     begin
       MnuTaskTree.Checked := not MnuTaskTree.Checked;
       TbtnTask.Down := mnutasktree.Checked;
       if TbtnTask.Down then
       begin
         Framtree_search.Visible := false;
         Framtree_browser.Visible := false;
         Framtree_task.Parent := Self;
         Framtree_task.Align := alleft;
         Framtree_task.Visible := true;
         Splitter2.Visible := true;
       end else
       begin
         Splitter2.Visible := false;
         Framtree_task.Visible := false;
       end;
     end;
    NavigatorView:
     begin
       mnubrowser.Checked := not mnubrowser.Checked;
       tbtnprj.Down := mnubrowser.Checked;
       if tbtnprj.Down then
       begin
         Framtree_task.Visible := false;
         Framtree_search.Visible := false;
         Framtree_browser.Parent := self;
         Framtree_browser.Align := alleft;
         Framtree_browser.Visible := true;
         Splitter2.Visible := true;
       end else
       begin
         Splitter2.Visible := false;
         Framtree_browser.Visible := false;
       end;
     end;
     SearchView:
     begin
       mnusearch.Checked := not mnusearch.Checked;
       tbtnsearch.Down := mnusearch.Checked;
       if tbtnsearch.Down then
       begin
          Framtree_browser.Visible := false;
          Framtree_task.Visible := false;
          Framtree_search.Parent := self;
          Framtree_search.Align := alleft;
          Framtree_search.Visible := true;
          if ParamCount>1 then
          begin
           Framtree_search.ComboBox1.Visible:=true;
           Framtree_search.Label9.Visible := true;
          end;
          Splitter2.Visible := true;
       end else
       begin
         Splitter2.Visible := false;
         Framtree_search.Visible := false;
       end;
     end;
   end;
   result:=true;
end;

//加载任务,分配权限
procedure TFrm_Main.FormShow(Sender: TObject);
begin
  Framtree_task.LoadTree;
  if ParamStr(1)<>'' then  ShowTree(SearchView)
  else ShowTree(TaskView);
  Cbx_Nav.ItemIndex:=0;
  Pnl_right.Align := alClient;
  Dopermission;
//  if ParamStr(1)='' then frm_Delayprj.Show;
// 
end;

procedure TFrm_Main.closeleft(var Msg: Tmessage);
begin
  ShowTree(Msg.LParam);  
end;

//单击列表列标题按升序或降序排列项目
procedure TFrm_Main.Lsv_TaskColumnClick(Sender: TObject;
  Column: TListColumn);
var PreColumn,Flag:integer;
begin
   PreColumn := ColumnToSort;
   ColumnToSort := Column.Index;
   if ColumnToSort<>PreColumn then
   begin
     (Sender as TCustomListView).CustomSort(nil,0);
     if Flag<>1 then flag := 1;
     if PreColumn<>0  then
        Lsv_Task.Columns[PreColumn].ImageIndex:=-1;
     if  ColumnToSort>0 then
        Lsv_Task.Columns[ColumnToSort].ImageIndex:=1;
   end else
   begin
     (Sender as TCustomListView).CustomSort(nil,flag);
      if ColumnToSort<>0 then
      if Lsv_Task.Columns[ColumnToSort].ImageIndex=1 then
         Lsv_Task.Columns[ColumnToSort].ImageIndex := 2
      else Lsv_Task.Columns[ColumnToSort].ImageIndex := 1;
      if Flag=0 then Flag := 1 else Flag := 0 ;
   end;
end;


procedure TFrm_Main.Lsv_TaskCompare(Sender: TObject; Item1, Item2: TListItem;
  Data: Integer; var Compare: Integer);
var
  ix: Integer;
begin
   case data of
    0: if ColumnToSort = 0 then
         Compare := CompareText(Item1.Caption,Item2.Caption)
       else
       begin
         ix := ColumnToSort - 1;
         Compare := CompareText(item1.SubItems[ix],Item2.SubItems[ix]);
       end;
    1: if ColumnToSort = 0 then
          Compare := CompareText(Item1.Caption,Item2.Caption)
       else
       begin
         ix := ColumnToSort - 1;
         Compare := -CompareText(Item1.SubItems[ix],Item2.SubItems[ix]);
       end;
  end;
end;

//调用帮助文档
procedure TFrm_Main.AhlpExecute(Sender: TObject);
begin
  //ShowMessage('sorry ,The Help File is not available currently');
  executefile(Extractfilepath(paramstr(0))+'EPMhelp.CHM','','',SW_SHOW );
end;

//显示系统封面
procedure TFrm_Main.aboutExecute(Sender: TObject);
begin

end;

//新建业扩工程
procedure TFrm_Main.newgxExecute(Sender: TObject);
begin
  Application.CreateForm(TFrm_new,Frm_new);
  try
    Frm_New.Init('ykgc',loginuser);
    Frm_New.showmodal;
  finally
    Frm_New.Free;
  end;
end;

//新建代工工程
procedure TFrm_Main.newdgExecute(Sender: TObject);
begin
  Application.CreateForm(TFrm_new,Frm_new);
  try
    Frm_new.Init('DGXM',loginuser);
    Frm_new.showmodal;
  finally
    Frm_new.Free;
  end;
end;

//发送工程到下一个可能的流程节点
procedure TFrm_Main.AsendprjExecute(Sender: TObject);
var cNodecode,cRecordid:string;
begin
   if (not Lsv_Task.Visible) and
      (Fram_TltBase.cxTLt_com.FocusedNode.Data<>nil) and
      (Ptaskinfo(Fram_TltBase.cxTLt_com.FocusedNode.Data).Executor=Loginuser) then
   begin
     cRecordid := Ptaskinfo(Fram_TltBase.cxTLt_com.FocusedNode.Data).prjdm;
     cNodecode := trim(Ptaskinfo(Fram_TltBase.cxTLt_com.FocusedNode.Data).nodecode);
     Frm_FlowControl := TFrm_FlowControl.Create(Application,cRecordid,cNodecode);
     Frm_FlowControl.GetDirection(cNodecode);
     try
       if Frm_FlowControl.showmodal=mrok then
       begin
         if Frm_FlowControl.IsSelf then       //如果工程发送给自己则刷新任务
            Arefresh.Execute
         else
         begin                                //否则在任务列表中删除对应的工程
           // Fram_TltBase.dxTlt_common.FocusedNode.Deleting;
            Fram_TltBase.cxTLt_com.FocusedNode.Free;
         end;
         showmessage('您正在处理的工程项目已成功发送');
       end;
     finally
       Frm_flowcontrol.Free;
     end;
   end else
      if  (Lsv_Task.Visible)   and
         ((Ptaskinfo(Lsv_Task.Selected.Data).Executor=Loginuser) or
          ((Ptaskinfo(Lsv_Task.Selected.Data).TaskName='工程施工') and
           (RolName='计划员') )) then
    begin
       cRecordid := Ptaskinfo(Lsv_Task.Selected.Data).Prjdm;
       cNodecode := trim(Ptaskinfo(Lsv_Task.Selected.Data).Nodecode);
       Frm_FlowControl := TFrm_FlowControl.Create(Application,cRecordid,cNodecode);
       Frm_FlowControl.GetDirection(cNodecode);
       try
         if Frm_FlowControl.showmodal=mrok then
         begin
              if Frm_FlowControl.IsSelf then       //如果工程发送给自己则刷新任务
                 Arefresh.Execute
              else begin                                //否则在任务列表中删除对应的工程
                // Fram_TltBase.dxTlt_common.FocusedNode.Deleting;
                 Lsv_Task.Selected.Delete;
              end;
              showmessage('您正在处理的工程项目已成功发送');
            end;
          finally
            Frm_flowcontrol.Free;
          end;
    end else showmessage('请您选择要递交的项目或者您现在不具备条件');
end;


procedure TFrm_Main.Lsv_TaskDblClick(Sender: TObject);
var tempNode:TTreeNode;
    I:integer;
begin
 // if Fram_TltBase.dxTlt_common.FocusedNode = nil then Exit;
  if FramTree_task.Visible then  ExpandChild(FramTree_task)
  else if FramTree_Browser.Visible then Expandchild(FramTree_Browser)
  else if Framtree_Search.Visible  then
  begin
    if FramTree_task.Trvwdefaut.Selected.Text='搜索结果' then
     ShowDetailInfo(2)
    else ExpandChild(FramTree_task);
  end;
end;

//展开子项目,如果为叶子节点则显示工程详细信息
procedure TFrm_Main.Expandchild(Targetfram: Tframe);
var TempNode:TtreeNode;
    I:Integer;
begin
   with TFram_Tree(Targetfram) do
   begin
     if TrvwDefaut.Selected.HasChildren then
     begin
         TempNode := Trvwdefaut.Selected.getFirstChild;
         if (TempNode.Text <>Lsv_Task.Selected.Caption)  then
         repeat
            TempNode := Trvwdefaut.Selected.GetNextChild(TempNode);
         until (TempNode.Text = Lsv_Task.Selected.Caption);
         TrvwDefaut.Selected := TempNode;
     end
     else begin
      if Lsv_Task.Visible then
       ShowDetailInfo(2)
      else ShowDetailInfo(1);
     end;
    end;
end;

//刷新任务导航视图,重新加载工程任务项目

procedure TFrm_Main.ArefreshExecute(Sender: TObject);
var RootNode,Node,TempNode:TTreenode;
    I,J:integer;
begin
 with Framtree_task do
 begin
   RootNode := Trvwdefaut.TopItem.getNextSibling;
   Node:=RootNode.getFirstChild;
   for J:=0 to RootNode.Count-1 do
   begin
     Node.Selected := True;
     if Node.HasChildren then
     begin
       for I := 0 to Node.Count-1 do
       begin
         Dispose(Node.Item[I].Data);
       end;
       I := 0;
       Repeat
        TempNode := Node.GetFirstChild;
        TempNode.Free;
       until Tempnode = nil;
       Node:=Node.getNextSibling;
     end;
   end;
   LoadTree;
   Trvwdefaut.TopItem.Selected := true;
   RootNode.Selected:=true;
 end;
end;


procedure TFrm_Main.Tm_SystemTimer(Sender: TObject);
begin
  STBmain.Panels[1].text := FormatDateTime('YYYY"年"MM"月"DD"日" hh:nn:ss',NOW);

  STBmain.Panels[0].text := '欢迎'+Loginuser;
end;

procedure TFrm_Main.N51Click(Sender: TObject);
begin
  Lsv_Task.ViewStyle := vsicon;
end;


procedure TFrm_Main.N52Click(Sender: TObject);
begin
  Lsv_Task.ViewStyle := vssmallicon;
end;

procedure TFrm_Main.N53Click(Sender: TObject);
begin
   Lsv_Task.ViewStyle := vslist;
end;

procedure TFrm_Main.N54Click(Sender: TObject);
begin
   Lsv_Task.ViewStyle := vsreport;
end;

procedure TFrm_Main.N61Click(Sender: TObject);
begin
  application.CreateForm(Tfrm_ImportWtDesign,frm_ImportWtDesign);
  try
    frm_ImportWtDesign.ShowModal;
  finally
    frm_ImportWtDesign.Free;
  end;
end;

//切换导航视图中导航树的组织方式
procedure TFrm_Main.Cbx_NavChange(Sender: TObject);
begin
  if  Cbx_Nav.ItemIndex=0 then
  begin
      TbtnTask.Down:=true;
      mnutasktree.Checked:=true;
      Framtree_search.Visible := false;
      Framtree_browser.Visible := false;
      Framtree_task.Parent := self;
      Framtree_task.Align := alleft;
      Framtree_task.Visible := true;
      Splitter2.Visible := true;
      Arefresh.Execute;
  end else
  begin
    if  not mnubrowser.Checked then
    ShowTree( NavigatorView);
    Framtree_browser.UpdateTree(Trim(Cbx_Nav.Items.Strings[Cbx_Nav.ItemIndex]));
  end;
end;

//调用设置流程和及设置用户和角色管理模块
procedure TFrm_Main.AsetflowExecute(Sender: TObject);
begin
   ExecuteFile(ExtractFilePath(Application.ExeName)+'FlowManage.exe','','',SW_SHOW);
end;

procedure Tfrm_Main.FormCreate(Sender: TObject);
var MyIniFile:Tinifile;
    Path:string;
begin
  Path:=Extractfilepath(paramstr(0))+'Appconfig.ini';
  MyIniFile := TIniFile.Create(path);

  FilePath := MyIniFile.ReadString('DocSavePath', 'FilePath_Mh','');
  //FilePath_Qp
  MyIniFile.Free;
end;

//分配操作权限
{ TODO 1 -o程哨兵 -c重构 : 重新设计编写权限分配的处理方式 }
procedure TFrm_Main.Dopermission;
var I:integer;
begin
  if permission=1 then
  begin
    for I:=0 to ActionList1.ActionCount-1 do
    begin
      if (ActionList1.Actions[I].Tag=1) or (ActionList1.Actions[I].Tag=0) then
         Taction(ActionList1.Actions[I]).Enabled:=true
      else if ActionList1.Actions[I].Tag=10 then
         Taction(ActionList1.Actions[I]).Enabled:=true
      else   Taction(ActionList1.Actions[I]).Enabled:=false;
    end;
  end else
  if permission=2 then
  begin
    for I:=0 to ActionList1.ActionCount-1 do
    begin
      if  ActionList1.Actions[I].Tag=0 then
         Taction(ActionList1.Actions[I]).Enabled:=true
      else Taction(ActionList1.Actions[I]).Enabled:=false;
    end;
  end else
  if permission=3 then
  begin
    for I:=0 to ActionList1.ActionCount-1 do
    begin
      if (ActionList1.Actions[I].Tag=3) or (ActionList1.Actions[I].Tag=0) then
         Taction(ActionList1.Actions[I]).Enabled:=true
      else if ActionList1.Actions[I].Tag=10 then
         Taction(ActionList1.Actions[I]).Enabled:=true
      else Taction(ActionList1.Actions[I]).Enabled:=false;
    end;
  end else
  if permission=4 then
  begin
    for I:=0 to ActionList1.ActionCount-1 do
    begin
      if (ActionList1.Actions[I].Tag=4) or (ActionList1.Actions[I].Tag=0) then
         Taction(ActionList1.Actions[I]).Enabled:=true
      else if ActionList1.Actions[I].Tag=10 then
         Taction(ActionList1.Actions[I]).Enabled:=true
      else Taction(ActionList1.Actions[I]).Enabled:=false;
    end;
  end;
  if (UserDepart = '财务科') or ( Loginuser = '康健') then
     Archprj.Enabled:=true;
  if (userdepart='设计室')  then
       newsubprj.Enabled := true;
  if  permission=5  then
  begin
     Awtdesign.Enabled := true;
     delete.Enabled := false;
     Archprj.Enabled := false;
  end;
end;

//新建电业内部工程
procedure TFrm_Main.newsbExecute(Sender: TObject);
begin
  application.CreateForm(TFrm_new,Frm_new);
  try
    Frm_new.Init('nbgc',loginuser);
    Frm_new.showmodal;
  finally
    Frm_new.free;
  end;
end;

//重新登录
procedure TFrm_Main.reloginExecute(Sender: TObject);
begin
  try
    Application.CreateForm(TFRM_LOGIN, FRM_LOGIN);
    if frm_login.ShowModal<> Idok then exit
    else begin
      Arefresh.Execute;
      if not mnutasktree.Checked then
      ShowTree(TaskView);
      Dopermission;
    end;
  finally
    frm_login.Free;
  end;
end;

//删除废件
procedure TFrm_Main.clearrecycleExecute(Sender: TObject);
begin
  if (Lsv_Task.Selected<>nil) and (framtree_task.Trvwdefaut.Selected.Text='垃圾箱') then
  begin
     if MessageBox(self.Handle,'从废件箱中删除工程将删除此工程所有相关的信息，您确定吗？','Easy Project'
                               ,MB_YESNO+MB_ICONWARNING)=IdYes then
     begin
        if  Cleardel(Ptaskinfo(Lsv_Task.Selected.Data).prjdm) then
        begin
           Lsv_Task.Selected.Free;;
           showmessage('工程已删除');
        end else showmessage(ErrorHint);
        //to do list to seg
     end;
  end;
end;

//删除工程
procedure TFrm_Main.deleteExecute(Sender: TObject);
begin
  if (Fram_TltBase.cxTLt_com.FocusedNode<>nil) and (Fram_TltBase.cxTLt_com.FocusedNode.Data<>nil) then
  begin
     if MessageBox(self.Handle,'您确定要删除当前选中的工程吗？','Easy Project'
                               ,MB_YESNO+MB_ICONWARNING)=IdYes then
     begin
       if Delprj(Ptaskinfo(Fram_TltBase.cxTLt_com.FocusedNode.Data).prjdm) then
       begin
          Fram_TltBase.cxTLt_com.FocusedNode.Free;
          showmessage('工程已删除至废件箱');
       end else showmessage(ErrorHint);
     end;
  end;
  if Lsv_Task.Visible and (Lsv_Task.Selected<>nil) then
  begin
     if MessageBox(self.Handle,'您确定要删除当前选中的工程吗？','Easy Project'
                               ,MB_YESNO+MB_ICONWARNING)=IdYes then
     begin
       if Delprj(Ptaskinfo(Lsv_Task.Selected.Data).prjdm) then
       begin
         Lsv_Task.Selected.Free;
         ShowMessage('工程已删除至废件箱');

       end else ShowMessage(ErrorHint);
     end;
  end;
end;

//还原工程
procedure TFrm_Main.returnExecute(Sender: TObject);
begin
  if (Lsv_Task.Selected<>nil) and (framtree_task.Trvwdefaut.Selected.Text='垃圾箱') then
  begin
    if MessageBox(self.Handle,'从废件箱中还原工程，您确定吗？','Easy Project'
                              ,MB_YESNO+MB_ICONWARNING)=IdYes then
    begin
      if  Returnprj(Ptaskinfo(Lsv_Task.Selected.Data).prjdm) then
      begin
         Lsv_Task.Selected.Delete;
         showmessage('工程已还原');
      end else showmessage(ErrorHint);
    end;
  end;
end;

//暂停工程,将工程放入缓办箱
procedure TFrm_Main.PauseExecute(Sender: TObject);
var strReason:string;
begin
  if (Fram_TltBase.cxTLt_com.FocusedNode<>nil) and (Fram_TltBase.cxTLt_com.FocusedNode.Data<>nil) then
  begin
    if MessageBox(self.Handle,'您确定要暂缓当前选中的工程吗？','Easy Project'
                              ,MB_YESNO+MB_ICONWARNING)=IdYes then
    begin
       if InputQuery('暂缓原因','请输入暂缓原因',strReason) then
         if Pauseprj(Ptaskinfo(Fram_TltBase.cxTLt_com.FocusedNode.Data).prjdm,
                      Ptaskinfo(Fram_TltBase.cxTLt_com.FocusedNode.Data).nodecode,strReason) then
         begin
           Fram_TltBase.cxTLt_com.FocusedNode.Free;
            showmessage('工程已移到暂缓项目箱');
         end else showmessage(ErrorHint);
    end;
  end;
end;

//重新启动工程项目
procedure TFrm_Main.reactiveExecute(Sender: TObject);
begin
  if (Lsv_Task.Visible) and (Framtree_task.Trvwdefaut.Selected.Text='暂缓箱') then
  begin
    if MessageBox(self.Handle,'您确定要将暂缓项目重新启动并移至当前任务箱吗？','Easy Project'
                              ,MB_YESNO+MB_ICONINFORMATION)=IdYes then
    begin
      if Reactiveprj(Ptaskinfo(Lsv_Task.Selected.Data).prjdm,
                   Ptaskinfo(Lsv_Task.Selected.Data).nodecode) then
      begin
         Lsv_Task.Selected.Delete;
         Showmessage('工程已移到我的任务箱');
      end else Showmessage(ErrorHint);
    end;
 end;
end;

//打开报表管理模块
procedure TFrm_Main.RepManageExecute(Sender: TObject);
begin
  application.CreateForm(Tfrm_report,frm_report);
  try
    frm_report.ShowModal;
  finally
    frm_report.Free;
  end;
end;

//新建用改工程
procedure TFrm_Main.newygExecute(Sender: TObject);
begin
 
  Application.CreateForm(TFrm_new,Frm_new);
  try
    Frm_New.Init('ykgc_pt',loginuser);
    Frm_New.showmodal;
  finally
    Frm_New.Free;
  end;
end;

procedure TFrm_Main.mnunavigatorClick(Sender: TObject);
begin
  ShowTree(TMenuItem(Sender).Tag);
end;

//显示工程项目的详细信息  { TODO : 双击时如果是空白区域，则报错 }
procedure TFrm_Main.ShowDetailInfo(const FocusTag:Integer);
begin
   Application.CreateForm(TFrm_PrjDesign,Frm_PrjDesign);
   try
     if FocusTag=1 then
     begin
       Frm_PrjDesign.PrjCode :=  Ptaskinfo(Fram_TltBase.cxTLt_com.FocusedNode.data).PrjDm;
       Frm_PrjDesign.Executor := Ptaskinfo(Fram_TltBase.cxTLt_com.FocusedNode.data).Executor;
       Frm_PrjDesign.NodeCode := Ptaskinfo(Fram_TltBase.cxTLt_com.FocusedNode.data).Nodecode;
       Frm_PrjDesign.Prjtype :=  Ptaskinfo(Fram_TltBase.cxTLt_com.FocusedNode.data).Prjtype;
       Frm_PrjDesign.ShowModal;
     end;
     if FocusTag=2 then
     begin
       Frm_PrjDesign.PrjCode :=  Ptaskinfo(Lsv_Task.Selected.data).PrjDm;
       Frm_PrjDesign.Executor := Ptaskinfo(Lsv_Task.Selected.data).Executor;
       Frm_PrjDesign.NodeCode := Ptaskinfo(Lsv_Task.Selected.data).Nodecode;
       Frm_PrjDesign.Prjtype :=  Ptaskinfo(Lsv_Task.Selected.data).Prjtype;
       Frm_PrjDesign.ShowModal;
     end;
   finally
     Frm_PrjDesign.Free;
   end;
end;

procedure TFrm_Main.A_advanceSearchExecute(Sender: TObject);
begin
  frm_Search.Show;

end;

//打开用户内部工程管理模块
procedure TFrm_Main.A_SearchInterprjExecute(Sender: TObject);
begin
  //ExecuteFile(ExtractFilePath(Application.ExeName)+'Interprj.exe','','',SW_SHOW);
end;

procedure TFrm_Main.AmodpwdExecute(Sender: TObject);
begin
  application.CreateForm(TFrm_ModPwd,Frm_ModPwd);
  try
    Frm_ModPwd.ShowModal;
  finally
    Frm_ModPwd.Free;
  end;
end;

procedure TFrm_Main.ArchprjExecute(Sender: TObject);
begin
  if Lsv_Task.Visible then ArcFindPrj
  else
  if (Fram_TltBase.cxTLt_com.FocusedNode<>nil)
       and (Fram_TltBase.cxTLt_com.FocusedNode.Data<>nil) then
  begin
     if MessageBox(self.Handle,'您确定要归档选中的工程吗？','Easy Project'
                               ,MB_YESNO+MB_ICONWARNING)=IdYes then
     begin
       if Arcprj(Ptaskinfo(Fram_TltBase.cxTLt_com.FocusedNode.Data).prjdm,
              Ptaskinfo(Fram_TltBase.cxTLt_com.FocusedNode.Data).nodecode) then
       begin
         Fram_TltBase.cxTLt_com.FocusedNode.Free;
         showmessage('工程已归档');
       end else showmessage(ErrorHint);
     end;
  end;

end;

procedure TFrm_Main.newsubprjExecute(Sender: TObject);
var csql,ctemp:string;
    temPoniter:Ptaskinfo;
begin
  if (Fram_TltBase.Visible) and (Fram_TltBase.cxTLt_com.FocusedNode<>nil )  then
  temPoniter := Ptaskinfo(Fram_TltBase.cxTLt_com.FocusedNode.data)
  else if (Lsv_Task.Visible) and (Lsv_Task.Selected <>nil ) then
   temPoniter := Ptaskinfo(Lsv_Task.Selected.data);
//  if (LoginUser<> temPoniter.Executor) Or (UserDepart<>'设计室') then
//  begin
//    showmessage('您不能新建子工程，只有设计室主任有此权限');
//    exit;
//  end;
  application.CreateForm(TFrm_new,Frm_new);
  try
    if (temPoniter.prjtype='业扩') or (temPoniter.prjtype='业扩配套') or (temPoniter.prjtype='住宅配套') then
      Frm_new.Init('subykprj',loginuser, temPoniter.prjdm)
    else if  temPoniter.prjtype='代工' then
      Frm_new.Init('subdgprj',temPoniter.PrjDm,
         temPoniter.PrjSource)
    else Frm_new.Init('subdyprj',loginuser, temPoniter.Prjdm);
    Frm_new.showmodal;
  finally
    Frm_new.free;
  end;
end;

procedure TFrm_Main.AwtdesignExecute(Sender: TObject);
var strDesignBy:string;
begin
   if  (Fram_TltBase.cxTLt_com.FocusedNode=nil) or
                       (Fram_TltBase.cxTLt_com.FocusedNode.Data=nil)  then
   begin
     Showmessage('请选择要委托设计的工程');  //
     exit;
   end;
  if InputQuery('委托设计','请输入委托设计单位',strDesignBy) then
   if Dm_Epm.Wtdesign( Ptaskinfo(Fram_TltBase.cxTLt_com.FocusedNode.Data).prjdm,
                Ptaskinfo(Fram_TltBase.cxTLt_com.FocusedNode.data).nodecode,
                strDesignBy )  then
  begin
    Fram_TltBase.cxTLt_com.FocusedNode.Free;
    showmessage('工程已移到委托设计项目箱');
  end
  else ShowMessage(ErrorHint);


end;

procedure TFrm_Main.N10Click(Sender: TObject);
begin
  application.CreateForm(Tfrm_setpara,frm_setpara);
  try
    frm_setpara.ShowModal;
  finally
    frm_setpara.Free;
  end;
end;

procedure TFrm_Main.N29Click(Sender: TObject);
begin
  application.CreateForm(Tfrm_contractcompany,frm_contractcompany);
  try
    frm_contractcompany.ShowModal;
  finally
    frm_contractcompany.Free;
  end;
end;

procedure TFrm_Main.AsetmatExecute(Sender: TObject);
begin
  ExecuteFile(ExtractFilePath(Application.ExeName)+'Mat_maintance.exe','','',SW_SHOW);
end;

procedure TFrm_Main.N44Click(Sender: TObject);
var csql,Para1,Para2,Para3,para4,para5:string;
begin
   application.CreateForm(Tfrm_sumcondition,frm_sumcondition);
   try
     if frm_sumcondition.ShowModal=mrok then
     begin
        if frm_sumcondition.CheckBox1.Checked then
         Para1:=  trim(frm_sumcondition.Cb_depart.Text)
        else para1:='';
        if frm_sumcondition.CheckBox2.Checked then
         Para2:=  trim(frm_sumcondition.cb_employee.Text)
        else para2:='';
        if frm_sumcondition.CheckBox3.Checked then
        begin
           para3:= datetostr(frm_sumcondition.dtp_begin.Date);
           para4:= datetostr(frm_sumcondition.dtp_end.Date);
        end;
        if frm_sumcondition.CheckBox4.Checked then
         Para5:= trim(frm_sumcondition.cb_type.Text);
        if frm_sumcondition.RadioGroup1.ItemIndex=0 then
         cSql:='Exec OutPlanPrj '''+para1+''','''+para2+''','''+para5+''','''+CurCorpCode+''''
        else cSql:='Exec SumOutPlanPrj '''+para1+''','''+para2+''','''+para3+''','''+para4+''','''+para5+''','''+CurCorpCode+'''';
        qrywork(dm_epm.adoqry_rep,csql,false);

//        if frxReport1.LoadFromFile(extractfilepath(paramstr(0))+'\reports\'
//             +'OutPlan.fr3',true)   then
//            // frxReport1.PrepareReport(true )
//             frxReport1.ShowReport(true);
     end;
   finally
     frm_sumcondition.Free;
   end;
end;

procedure TFrm_Main.DisusePrjExecute(Sender: TObject);
var strReason:string;
begin
  if (Fram_TltBase.cxTLt_com.FocusedNode<>nil) and (Fram_TltBase.cxTLt_com.FocusedNode.Data<>nil) then
  begin
     if InputQuery('暂缓原因','请输入作废原因',strReason) then
     if MessageBox(self.Handle,'您确定要作废当前选中的工程吗？','Easy Project'
                               ,MB_YESNO+MB_ICONWARNING)=IdYes then
     begin
       if dm_epm.Disuseprj(Ptaskinfo(Fram_TltBase.cxTLt_com.FocusedNode.Data).prjdm,strReason) then
       begin
          Fram_TltBase.cxTLt_com.FocusedNode.Free;
          showmessage('工程已作废');
       end else showmessage(ErrorHint);
     end;
  end;
end;

procedure TFrm_Main.NewkyExecute(Sender: TObject);
begin
  application.CreateForm(TFrm_new,Frm_new);
  try
    Frm_new.Init('kysb',loginuser);
    Frm_new.showmodal;
  finally
    Frm_new.free;

  end;
end;


//设计更改流程，选中工程后，申请设计更改单，审核以后，工程处于设计更改状态
//设计更改申请人只能是设计员，审核人员，锁定正常流程，更改完成后，解冻。
//写设计更改历史记录，记录版本号。

procedure TFrm_Main.DesignModExecute(Sender: TObject);
begin
  //
end;

procedure TFrm_Main.ToolButton19Click(Sender: TObject);
begin
  frm_Delayprj.Show;
end;

procedure TFrm_Main.ToolButton20Click(Sender: TObject);
begin
frm_DelayContract.Adoqry_Delaycontractprj.Active := false;
frm_DelayContract.Adoqry_Delaycontractprj.Active := true;
frm_DelayContract.Show;
end;

procedure TFrm_Main.newldExecute(Sender: TObject);
begin
  Application.CreateForm(TFrm_new,Frm_new);
  try
    Frm_new.Init('DGXM_ld',loginuser);
    Frm_new.showmodal;
  finally
    Frm_new.Free;
  end;
end;

procedure TFrm_Main.newpfmExecute(Sender: TObject);
begin
  Application.CreateForm(TFrm_new,Frm_new);
  try
    Frm_New.Init('ykgc_pm',loginuser);
    Frm_New.showmodal;
  finally
    Frm_New.Free;
  end;
end;

procedure TFrm_Main.newmgExecute(Sender: TObject);
begin
   Application.CreateForm(TFrm_new,Frm_new);
  try
    Frm_New.Init('ykgc_mg',loginuser);
    Frm_New.showmodal;
  finally
    Frm_New.Free;
  end;
end;

procedure TFrm_Main.SpeedButton1Click(Sender: TObject);
var I:Integer;
begin
   for I :=0  to Fram_TltBase.cxTLt_com.Count-1 do
   Fram_TltBase.cxTLt_com.Items[I].Expand(True);
end;

procedure TFrm_Main.Pmnitem_HideClick(Sender: TObject);
begin
  if (Fram_TltBase.cxTLt_com.FocusedNode<>nil) and
              Fram_TltBase.cxTLt_com.FocusedNode.HasChildren   then
  begin
     FinishPrj(Ptaskinfo(Fram_TltBase.cxTLt_com.FocusedNode.Data).prjdm,
        Ptaskinfo(Fram_TltBase.cxTLt_com.FocusedNode.Data).NodeCode,1);
     Fram_TltBase.cxTLt_com.FocusedNode.Free;
  end
  else begin
     ShowMessage('请选择父工程');
     exit;
  end;
end;

procedure TFrm_Main.NewDesginPrjExecute(Sender: TObject);
begin
  application.CreateForm(TFrm_new,Frm_new);
  try
    Frm_new.Init('designprj',loginuser);
    Frm_new.showmodal;
  finally
    Frm_new.free;
  end;
end;

procedure TFrm_Main.N71Click(Sender: TObject);
begin
 { Application.CreateForm(Tfrm_Getfee,frm_Getfee);
  try
    frm_Getfee.ShowModal;
  finally
    frm_Getfee.Free;
  end; }
end;

procedure TFrm_Main.N72Click(Sender: TObject);
begin
      // 导入excel表格中的工程预算明细数据，包括 施工合同金额，设计费、监理费、测绘费，安厝费等
 application.CreateForm(Tfrm_importbudget,frm_importbudget);
  try
    frm_importbudget.ShowModal;
  finally
    frm_importbudget.Free;
  end;
end;
        // 导入审价清单，批量增量导入
procedure TFrm_Main.N73Click(Sender: TObject);
begin
  application.CreateForm(Tfrm_importSj,frm_importSj);
  try
    frm_importSj.ShowModal;
  finally
    frm_importSj.Free;
  end;
end;
 // 导入营销类初设概算审批清单，批量增量导入
procedure TFrm_Main.N74Click(Sender: TObject);
begin
  application.CreateForm(Tfrm_importGspf,frm_importGspf);
  try
    frm_importGspf.ShowModal;
  finally
    frm_importGspf.Free;
  end;
end;

 // 工程结算报表管理
procedure TFrm_Main.N76Click(Sender: TObject);
begin
   application.CreateForm(Tfrm_jsreport,frm_jsreport);
  try
    frm_jsreport.ShowModal;
  finally
    frm_jsreport.Free;
  end;
end;

//
procedure TFrm_Main.N30Click(Sender: TObject);
var Plancomp,sgdw:string;
begin
  if userdepart = '工程管理部' then   sgdw:='闵行（集团）分公司'
  else  if userdepart = '工程公司工程部' then sgdw :='工程公司'
  else sgdw:='闵行（集团）分公司';
  Plancomp := 'UserID='+userjobid+' '+'UserName='+Loginuser+' '+'Dept='+sgdw;
  ExecuteFile(ExtractFilePath(Application.ExeName)+'ManufacturePlan.exe',Plancomp,'',SW_SHOW);
end;

procedure TFrm_Main.N31Click(Sender: TObject);
begin
  application.CreateForm(Tfrm_contractlist,frm_contractlist);
  try
    frm_contractlist.ShowModal;
  finally
    frm_contractlist.Free;
  end;
end;

procedure TFrm_Main.AsetuserExecute(Sender: TObject);
begin
  ExecuteFile(ExtractFilePath(Application.ExeName)+'UserManager.exe',userjobid,'',SW_SHOW);
end;

procedure TFrm_Main.ShowWebBrower;
begin
   if Fram_Browser=nil then
    begin
      Fram_Browser := TFram_Browser.Create(self);
      Fram_Browser.Parent := Pnl_right;
      Fram_Browser.Align := alclient;
      Fram_Browser.load;
    end;
    Fram_Browser.Visible:=true;
end;

procedure TFrm_Main.ShowFindResult;
begin
   Lsv_Task.Visible :=True;
   Lsv_Task.ViewStyle :=vsreport;
   pmnitem_send.Enabled:=true;
   newsubprj1.Enabled := True;
   Archprj.Enabled:= true;
   if delete.Enabled then
   Pmnitem_del.Enabled:=true;
end;



//******************************************************************************
//   过程功能: 更新ListView显示标题
//   输入参数:
//   输   出:
//   算法说明:
//******************************************************************************

procedure TFrm_Main.Updatecolumns;
var colcap:TstringList;
begin
   colcap:=Tstringlist.Create;
   try
     Lsv_Task.Columns.BeginUpdate;
     colcap.Add('');
     colcap.Add('项目名称');
     colcap.Add('项目帐号');
     colcap.Add('任务主题');
     colcap.Add('收到时间');
     colcap.Add('计划完成');
     colcap.Add('发件人');
     colcap.Add('当前执行人');
     colcap.Add('原因');
     AddLsvColumn(colcap);
     Lsv_Task.Columns[0].Width:=30;
     Lsv_Task.Columns[0].ImageIndex:=0;
     Lsv_Task.Columns[1].Width:=200;
     Lsv_Task.Columns[2].Width:=150;
     Lsv_Task.Columns[3].Width:=150;
     Lsv_Task.Columns[4].Width:=100;
     Lsv_Task.Columns[5].Width:=100;
   finally
     colcap.Free;
     Lsv_Task.Columns.EndUpdate;
   end;
end;
 { TODO -o程哨兵 -c重构 : 合并treeList的更新列标题函数功能 }
procedure TFrm_Main.UpdateNavCol();
var colcap:TstringList;
begin
   colcap:=Tstringlist.Create;
   try
     Lsv_Task.Columns.BeginUpdate;
     colcap.Add('');
     colcap.Add('项目名称');
     colcap.Add('项目帐号');
     colcap.Add('项目性质');
     colcap.Add('设计人');
     colcap.Add('项目状态');
     colcap.Add('当前执行人');
     AddLsvColumn(colcap);
     Lsv_Task.Columns[0].Width:=30;
     Lsv_Task.Columns[0].ImageIndex:=0;
     Lsv_Task.Columns[1].Width:=200;
     Lsv_Task.Columns[2].Width:=150;
     Lsv_Task.Columns[3].Width:=100;
     Lsv_Task.Columns[4].Width:=100;
     Lsv_Task.Columns[5].Width:=150;
     Lsv_Task.Columns[6].Width:=100;

   finally
     colcap.Free;
     Lsv_Task.Columns.EndUpdate;
   end;
end;

procedure  TFrm_Main.AddLsvColumn( ColCap:TStringlist; Imgindex:integer=-1);
var Caption:String;
    NewCol:Tlistcolumn;
begin
  Lsv_Task.Columns.Clear;
  for Caption in ColCap do
  begin
    with Lsv_Task.Columns do
    begin
       NewCol := add;
       NewCol.Caption:=Caption;
       NewCol.ImageIndex:=imgindex;
       NewCol.Alignment:=taLeftJustify;
       NewCol.Width:=ColumntextWidth;
    end;
  end;
end;

procedure TFrm_Main.ShowTaskOveriew(Node:TTreeNode);
var
  TaskCount,tempcount,I:Integer;
  colcap,Fieldlists:TStringList;
begin
    colcap:=Tstringlist.Create;
    try
      Lsv_Task.Columns.BeginUpdate;
      colcap.Add('任务类型');
      colcap.Add('总计');
      AddLsvColumn(colcap);
      Lsv_Task.Columns[0].Width:=150;
      Lsv_Task.Columns[1].Width:=100;
    finally
      colcap.Free;
      Lsv_Task.Columns.EndUpdate;
    end;
    Fieldlists:=Tstringlist.Create;
    try
      Lsv_Task.Items.BeginUpdate;
      Lsv_Task.Items.Clear;
      TaskCount:=0;
      for I:=0 to Node.Count-1 do
      begin
         Fieldlists.Clear;
         Fieldlists.Add(Node.Item[I].Text);
         tempcount := Framtree_Task.GetTaskNum(Node.Item[I]);
         Fieldlists.Add(Inttostr(tempcount));
         TaskCount:=TaskCount+tempcount;
         Additems(Lsv_Task,Fieldlists);
      end;
    finally
       Fieldlists.Free;
       Lsv_Task.ViewStyle:=vsreport;
       Lsv_Task.Items.EndUpdate;
       stbmain.panels[2].Text:='您要处理的工程项目总计：'+inttostr(TaskCount);
    end;
end;

procedure TFrm_Main.ShowRecyclePrj;
begin
    Updatecolumns;
    AddTaskList(C_Recycle,Framtree_Task.Trvwdefaut.Selected);
    if  Lsv_Task.Items.Count>0 then
      Lsv_Task.Visible :=True;
     Lsv_Task.ViewStyle :=vsreport;
    if clearrecycle.Enabled then
       Pmnitem_cleardel.Enabled:=true;
    if return.Enabled then
       Pmnitem_return.Enabled:=true;
end;

procedure TFrm_Main.ShowTaskByType;
begin
  Screen.Cursor := crHourGlass;
  Fram_TltBase.Parent := Pnl_right;
  Fram_TltBase.Align := alclient;
  Fram_TltBase.Visible := True;
  AddTaskList(C_Nodetype,Framtree_Task.Trvwdefaut.Selected);
  if delete.Enabled then
     Pmnitem_del.Enabled := True;
  Pause.Enabled := true;
  Pmnitem_pause.Enabled := True;
  Asendprj.Enabled := true;
  pmnitem_send.Enabled := True;
  Pmnitem_arc.Enabled := Archprj.Enabled ;
  Newsubprj1.Enabled := Newsubprj.Enabled ;
  Pmnitem_Wtdesign.Enabled := Awtdesign.Enabled ;
  Pmnitem_disuse.Enabled := True;
  Pmnitem_Hide.Enabled := True;
  Screen.Cursor := crDefault;
end;


{根据选择的任务项目类型，更新显示TreeList上的任务项目列表,并显示父类工程}
  { TODO -o程哨兵 -c重构 : 太长，重写 }
procedure TFrm_Main.AddTasklist(const Atype:string;Node:TtreeNode);
var
    csql:string;
    TaskPoniter:Ptaskinfo;
    IconIndex:Integer;
    DisplayValues: array[0..6] of Variant;
begin
   if Atype=C_Nodetype then
   begin
      if  Node.Parent.Text='待办箱' then
       cSql:='exec Getprjtask '''+Loginuser+''','''+Ptasktype(Node.Data).typename+''','
            +'''0'',''0'''
      else if Node.Parent.Text='已办箱' then
       cSql:='exec Getprjtask '''+Loginuser+''','''+Ptasktype(Node.Data).typename+''','
            +'''1'',''0'''
      else if node.Parent.Text = '退回箱' then
        cSql:='exec Getprjtask '''+Loginuser+''','''+Ptasktype(Node.Data).typename+''','
            +'''0'',''1''' ;
   end else
   if Atype=C_PausePrj        then  csql:='exec PausedTask '''+Loginuser+''''
   else if Atype=C_Recycle    then  csql:='exec RecycleTask '''+CurCorpCode+''''
   else if Atype=C_DisUsePrj  then  csql:='exec DisUsePrj '''+CurCorpCode+''' '
   else if Atype=C_DeletaPrj  then  csql:='exec GetWtdesign '''+Loginuser+'''';
   Qrywork(csql) ;

   if  (Atype=C_DisUsePrj) or (Atype=C_PausePrj )
      or (Atype=C_Recycle ) or (Atype=C_deletaprj)  then
     ShowPrjList(Atype)
   else
   begin
     UpdateTreelistCol;
     with Dm_Epm.adoqry_pub do
     begin
       while not Eof do
       begin
         New(TaskPoniter);
         DisplayValues[0] := FieldValues['prjaccount'];
         DisplayValues[1] := FieldValues['prjname'];
         DisplayValues[2] := FieldValues['Nodename'];
         DisplayValues[3] := FieldValues['Nodestart'];
         DisplayValues[4] := FieldValues['Planend'];
         DisplayValues[5] := FieldValues['sendfrom'];
         DisplayValues[6] := FieldValues['executor'];
         TaskPoniter.PrjDm := FieldByName('Prjcode').AsString;
         TaskPoniter.PrjName := FieldByName('Prjname').AsString;
         TaskPoniter.PrjAcc :=  FieldByName('Prjaccount').AsString;
         TaskPoniter.Prjtype :=  FieldByName('Typename').AsString;
         TaskPoniter.PrjSource :=  FieldByName('soucecode').AsString;
         TaskPoniter.Executor :=  trim(FieldByName('executor').AsString);
         TaskPoniter.NodeCode :=  trim(FieldByName('Nodecode').AsString);
         TaskPoniter.TaskName :=  trim(FieldByName('NodeName').AsString);
         if FieldByName('Planend').AsDateTime>Date then   IconIndex := 0
         else IconIndex := 1;
         Fram_TltBase.AddTreeListItem(DisplayValues,FieldByName('parentcode').AsString,TaskPoniter,IconIndex);
         Next;
       end;
       Close;
       Fram_TltBase.AutoFitColumns;
     end;

   end;
end;

procedure TFrm_Main.ShowDisUsePrj;
begin
   Updatecolumns;
   addtasklist(C_DisUsePrj,Framtree_Task.Trvwdefaut.Selected);
    if  Lsv_Task.Items.Count>0 then
    Lsv_Task.Visible :=True;
    Lsv_Task.ViewStyle :=vsreport;
//  Modified in 2006-10-15    
    Delete.Enabled := True;
    Pmnitem_del.Enabled := delete.Enabled;
end;

procedure TFrm_Main.ShowPausePrj;
begin
  Updatecolumns;
  Addtasklist(C_PausePrj,Framtree_Task.Trvwdefaut.Selected);
  if  Lsv_Task.Items.Count>0 then
  Lsv_Task.Visible :=True;
  Lsv_Task.ViewStyle :=vsreport;
  reactive.Enabled:=true;
  Pmnitem_react.Enabled:=true;
  delete.Enabled := True;
  Pmnitem_del.Enabled := delete.Enabled;
end;

procedure TFrm_Main.ShowWtDesign;
begin
  Updatecolumns;
  addtasklist(C_deletaprj,Framtree_Task.Trvwdefaut.Selected);
  if  Lsv_Task.Items.Count>0 then
  Lsv_Task.Visible :=True;
  Lsv_Task.ViewStyle :=vsreport;
  Asendprj.Enabled := true;
  pmnitem_send.Enabled:=true;

end;

procedure TFrm_Main.ShowPrjList(aType:string);
var
   Fieldlists:TStringList;
   Pitem:Ptaskinfo;
   NewItem:Tlistitem;
begin
  Fieldlists:=Tstringlist.Create;
  try
   Lsv_Task.Items.BeginUpdate;
   Lsv_Task.Items.Clear;
   with dm_epm.adoqry_pub do
   begin
     while not Eof do
     begin
       Fieldlists.Clear;
       Fieldlists.Add('');
       Fieldlists.Add(fieldbyname('prjname').AsString);
       Fieldlists.Add(fieldbyname('Prjaccount').AsString);
       Fieldlists.Add(fieldbyname('NodeName').AsString);
       Fieldlists.Add(formatdatetime('yyyy-mm-dd hh:nn',FieldbyName('NodeStart').AsDateTime));
       Fieldlists.Add(Formatdatetime('yyyy-mm-dd hh:nn',FieldbyName('planend').AsDateTime));
       Fieldlists.Add(Fieldbyname('Sendfrom').AsString);
       Fieldlists.Add(fieldbyname('Executor').AsString);
       if Atype='PausedTask' then
         Fieldlists.Add(fieldbyname('PausedReason').AsString)
       else if Atype='DisUsePrj' then
         Fieldlists.Add(fieldbyname('ZFreason').AsString);
       New(Pitem);
       Pitem.Prjdm := fieldbyname('xmdm').AsString;
       Pitem.Executor := trim(fieldbyname('Executor').AsString);
       Pitem.Nodecode := fieldbyname('NodeCode').AsString;
       Pitem.Taskname := fieldbyname('NodeName').AsString;
       Pitem.Designby := fieldbyname('DesignCompany').AsString;
       Pitem.Prjname := fieldbyname('prjname').AsString;
       Pitem.Prjsource := fieldbyname('SOUCECODE').AsString;
       Pitem.prjacc := fieldbyname('PRJACCOUNT').AsString;
       Pitem.prjtype := fieldbyname('TYPENAME').AsString;
       NewItem := Additems(Lsv_Task,Fieldlists);
       NewItem.Data := Pitem;
       Next;
     end;
     stbmain.Panels[2].Text:='您要处理的'+Framtree_Task.Trvwdefaut.Selected.Text
           +'工程项目总计:'+inttostr(RecordCount);
   end;
  finally
    Fieldlists.Free;
    Lsv_Task.Items.EndUpdate;
  end;
end;

procedure TFrm_Main.UpdateTreelistCol;
var  Columns:Tstringlist;
begin
   Columns := TstringList.Create;
   Columns.Add('项目帐号');
   Columns.Add('项目名称');
   Columns.Add('当前节点');
   Columns.Add('收到时间');
   Columns.Add('完成期限');
   Columns.Add('发件人');
   Columns.Add('当前执行人');
   Fram_TltBase.UpdateColumns(Columns);
   Columns.Free;
end;

                 
procedure TFrm_Main.ArcFindPrj;
begin
  if Lsv_Task.Visible and (Lsv_Task.Selected<>nil) then
  begin
     if MessageBox(self.Handle,'您确定要归档选中的工程吗？','Easy Project'
                               ,MB_YESNO+MB_ICONWARNING)=IdYes then
     begin
       if Arcprj(Ptaskinfo(Lsv_Task.Selected.Data).prjdm,Ptaskinfo(Lsv_Task.Selected.Data).nodecode) then
       begin
         Lsv_Task.Selected.Delete;
         showmessage('工程已归档');
       end else showmessage(ErrorHint);
     end;
  end;    
end;
end.


