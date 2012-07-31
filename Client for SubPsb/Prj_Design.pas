{*****************************************************************************
        Engineering Project Management Infomation System
                 For Minhang Power Supply Bureau

             原来,天还没亮, 黑夜却已等着落幕     札记[2002-07-10  Tuzz]
 模块: 项目业务处理主界面。
 描述: 工程项目的各类业务信息处理 ：包括：工程设计、工程计划、合同管理、竣工验收
       项目相关文档等。
 版本:
 日期: 2002-06-08
 作者: 程哨兵
 更新: 2003-05-12
 todo:
******************************************************************************}

unit Prj_Design;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, FmxUtils,Finance, ComCtrls,  ImgList,budget,prjRemark,
  ActnList, Prjbase, Engdoc,dm,pubvar,//DesignEvalution,
  prjcheck, UgetFee,Materal,
  prjplan,PrjExecontract,//FacilityOrder,//CustomerPrj,
  Documents,Assets, designcontract,  NodePlan,prjgantte, NewPrj,Framdgwt,
  Baseinfo_xt,Newygprj, kybg,RzGroupBar, RzPanel, RzButton, RzLabel, //Ubuddetail,
  StdCtrls, RzBckgnd, Menus,flowtrace,Flowlog;
  //,FrameMaterial,

type
  TFrm_PrjDesign = class(TForm)
    ActionList1: TActionList;
    PopupMenu1: TPopupMenu;
    ImageList2: TImageList;
    A_quit: TAction;
    A_inset: TAction;
    A_mod: TAction;
    A_del: TAction;
    A_save: TAction;
    A_cancel: TAction;
    A_viewdoc: TAction;
    A_opendoc: TAction;
    A_importdoc: TAction;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    A_print: TAction;
    N22: TMenuItem;
    Amod1: TMenuItem;
    Aviewdoc1: TMenuItem;
    Aopendoc1: TMenuItem;
    N23: TMenuItem;
    A_finish: TAction;
    A_send: TAction;
    RzGroupBar1: TRzGroupBar;
    RzGroup1: TRzGroup;
    RzGroup2: TRzGroup;
    RzGroup3: TRzGroup;
    RzGroup4: TRzGroup;
    RzGroup5: TRzGroup;
    RzGroup6: TRzGroup;
    ImageList1: TImageList;
    Fram_prjbase: TFram_prjbase;
    pnl_detail: TPanel;
    Panel3: TPanel;
    RzSeparator1: TRzSeparator;
    RzLabel1: TRzLabel;
    RzURLLabel1: TRzURLLabel;
    RzToolbar1: TRzToolbar;
    RzToolButton1: TRzToolButton;
    RzToolButton2: TRzToolButton;
    RzToolButton3: TRzToolButton;
    RzSpacer1: TRzSpacer;
    RzToolButton4: TRzToolButton;
    RzToolButton5: TRzToolButton;
    RzToolButton6: TRzToolButton;
    RzToolButton7: TRzToolButton;
    RzToolButton8: TRzToolButton;
    RzToolButton9: TRzToolButton;
    procedure A_quitExecute(Sender: TObject);
    procedure A_modExecute(Sender: TObject);
    procedure A_insetExecute(Sender: TObject);
    procedure A_delExecute(Sender: TObject);
    procedure A_importdocExecute(Sender: TObject);
    procedure A_saveExecute(Sender: TObject);
    procedure A_cancelExecute(Sender: TObject);
    procedure A_opendocExecute(Sender: TObject);
    procedure A_viewdocExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure A_printExecute(Sender: TObject);
    procedure A_sendExecute(Sender: TObject);
    procedure A_finishExecute(Sender: TObject);
    procedure RzGroup1Items1Click(Sender: TObject);
    procedure RzGroup2Items0Click(Sender: TObject);
    procedure RzGroup2Items1Click(Sender: TObject);
   // procedure RzGroup2Items3Click(Sender: TObject);
    procedure RzGroup2Items4Click(Sender: TObject);
    procedure RzGroup3Items0Click(Sender: TObject);
    procedure RzGroup3Items1Click(Sender: TObject);
    procedure RzGroup4Items0Click(Sender: TObject);
    procedure RzGroup4Items1Click(Sender: TObject);
    procedure RzGroup5Items0Click(Sender: TObject);
    procedure RzGroup6Items0Click(Sender: TObject);
    procedure RzGroup6Items1Click(Sender: TObject);
    procedure RzGroup6Items2Click(Sender: TObject);
    procedure RzGroup6Items3Click(Sender: TObject);
    procedure RzGroup6Items4Click(Sender: TObject);
    procedure RzGroup6Items5Click(Sender: TObject);
    procedure RzGroup1Open(Sender: TObject);
    procedure RzGroup5Items1Click(Sender: TObject);
  private
     CurrentItem:integer;
     procedure ShowDetailFram(TagetFram:Tframe) ;

    { Private declarations }
  public
    prjtype:string;                  //工程性质
    PrjCode:string;                  //工程代码
    Executor:string;                 //当前执行人
    NodeCode:string;                 //当前流程节点代码
    Fram_dg:TFram_dg;
    Fram_NewNbPrj:TFram_NewNbPrj;
    Fram_NewPrj:TFram_NewPrj;
    Fram_NewygPrj:TFram_NewygPrj;
    Fram_Dwg:TFram_Dwg;
    Fram_bud:TFram_budget;
   // Fram_Mat:TFram_Mat;
  //  Fram_DesignEva:TFram_DesignEva;

    Fram_Prjplan:TFram_Prjplan;
   // Fram_Facility:TFram_Facility;
    Fram_Execontract:TFram_Execontract;
    Fram_prjcheck:TFram_prjcheck;
  //  Fram_CustmerPrj:TFram_CustmerPrj;
    Fram_gdzc:TFram_gdzc;
    Fram_Finance:TFram_Finance;
    Frame_remark:TFrame_remark;
    Fram_PrjDoc:TFram_PrjDoc;
    Fram_log:TFram_log;
    Fram_Nodeplan:TFram_NodePlan;
    Fram_gante:TFram_gante;
    Fram_FlowTrace:TFram_FlowTrace;
    Fram_Descontract:TFram_Descontract;
    Fram_kybg:TFram_kybg;
   // FFrame_Material:TFrame_Material;
    FFram_GetFee:TFram_GetFee;
    //Ffram_buddeail:Tfram_buddetail;
    procedure FreeFram();
    Function  CheckValid(pageindex:Integer):Boolean;
    procedure ShowAssets();
  end;

var
  Frm_PrjDesign: TFrm_PrjDesign;

implementation

uses  MAIN, Viewdoc, tasktree,TreeListprj;

{$R *.dfm}

procedure TFrm_PrjDesign.ShowDetailFram(TagetFram:Tframe) ;
begin
  TagetFram.Parent := self.pnl_detail;
  TagetFram.Align := alclient;
  Panel2.Visible:= true;
  pnl_detail.Visible:=true;
  TagetFram.Visible:=true;
  //CurrentItem:=item.Index;
end;

// 在切换选择outlookbar的各个按钮时释放显示和处理各工程相关信息的Frame实例
procedure TFrm_PrjDesign.FreeFram();
var I:Integer;
    Tempfram: Tframe;
begin
  for I:=self.ComponentCount-1 downto 0 do
    if (Self.Components[I] is TFrame)  then
     if  (Tframe(Self.Components[I]).Name <> 'Fram_prjbase') then
       Tframe(Self.Components[I]).Free  ;
  //防止工程概况界面重画
 { if Fram_dg<>nil then
    Fram_dg.Visible := false;
  if  Fram_NewPrj<>nil then
     Fram_NewPrj.Visible:=false;
  if  Fram_NewygPrj<>nil then
     Fram_NewygPrj.Visible:=false;
  if  Fram_NewnbPrj<>nil then
     Fram_NewnbPrj.Visible:=false;
  if Fram_kybg<>nil then
    Fram_kybg.Visible:=false;  }
end;

procedure TFrm_PrjDesign.A_quitExecute(Sender: TObject);
begin
  close;
end;

 //根据用户选择的工程有关方面的信息,提供用户对其编辑、浏览的对话框或操作界面
procedure TFrm_PrjDesign.A_modExecute(Sender: TObject);
begin
  if RzGroupBar1.Groups[1].Opened then
  case  CurrentItem of
    0 : Fram_dwg.ModCadFile;
    1 : fram_bud.ModBud;
  //  2 : fram_mat.ModeMat;
   // 3 : Fram_NamePlateApply.Update ;
  //  5 : Fram_DesignEva.SetK1;
  end
  else if RzGroupBar1.Groups[2].Opened then
  case  CurrentItem of
    0 : Fram_PrjPlan.UpdatePlan;
    1 : Fram_Execontract.Updatecontract;
   // 2 : Fram_facility.UpdateOrderItem;
  end;
end;

//新建工程某方面的项目
procedure TFrm_PrjDesign.A_InsetExecute(Sender: TObject);
begin
  if RzGroupBar1.Groups[1].Opened then
  case CurrentItem of
    0: if Fram_dwg.AddCadFile then showmessage('设计图纸登记成功');
    1:if fram_bud.PageControl1.ActivePageIndex=0 then
          fram_bud.Addbud
       else fram_bud.Addbudoc;
  //  2: fram_mat.AddMat;
   // 3: Fram_NamePlateApply.AddApply;
    4: ;
  end
  else if RzGroupBar1.Groups[2].Opened then
  case CurrentItem of
    0: Fram_Prjplan.AddPlan;
    1: Fram_execontract.Updatecontract;
  //  2: Fram_facility.AddOrderItem;
  end
  else if RzGroupBar1.Groups[3].Opened then
  case CurrentItem of
    0: if Fram_gdzc<>nil then Fram_gdzc.AddBos;
    1: if Fram_gdzc<>nil then Fram_gdzc.AddBos;
    //2: Fram_facility.AddOrderItem;
  end;
end;

// 删除当前所选项目
procedure TFrm_PrjDesign.A_delExecute(Sender: TObject);
begin
  if RzGroupBar1.Groups[1].Opened then
  case CurrentItem of
    0: if fram_dwg.DelCadFile then showmessage('图档已删除');
    1: if fram_bud.PageControl1.ActivePageIndex=0 then
            fram_bud.Delbud
       else fram_bud.DelBudDoc;
   // 2: fram_mat.DelMat;
    //3: Fram_NamePlateApply;
  end
  else if  RzGroupBar1.Groups[2].Opened then
  case CurrentItem of
    0: Fram_prjPlan.DelPlan;
    1: showmessage('您不能删除施工合同，如要删除此项记录必须在工程计划栏目中进行');
  //  2: Fram_Facility.DelOrderItem;
    3: showmessage('用户内部工程信息由实业公司闵行分公司建立并维护，不能删除') ;
  end
  else if  RzGroupBar1.Groups[3].Opened then
  case CurrentItem of
   0: if Fram_gdzc<>nil then Fram_gdzc.DelBos;
   1: if Fram_gdzc<>nil then Fram_gdzc.DelBos;
   //2: Fram_facility.AddOrderItem;
 end;
end;

//从图档管理系统中导入对应工程的相关图档
procedure TFrm_PrjDesign.A_importdocExecute(Sender: TObject);
begin
 //
end;

//保存数据
procedure TFrm_PrjDesign.A_saveExecute(Sender: TObject);
begin
  if RzGroupBar1.Groups[0].Opened then
  case CurrentItem of
    0:begin
      if  Fram_dg<>nil then Fram_dg.SaveInfo;
      if  Fram_newprj<>nil then Fram_newprj.SaveInfo;
      if  Fram_newnbprj<>nil then Fram_newnbprj.SaveInfo;
      if  Fram_newygprj<>nil then Fram_newygprj.SaveInfo;
      if  Fram_kybg <>nil then Fram_kybg.SaveInfo;
      end;
  end ;
  if  RzGroupBar1.Groups[1].Opened then
  case CurrentItem of

    4: Fram_descontract.SaveInfo;
  end ;
//  if  RzGroupBar1.Groups[2].Opened then
//  case CurrentItem of
//
//   // 2: Fram_Facility.SaveOrder;
//   // 3: Fram_CustmerPrj.Saveinfo;
//  end ;
  if  RzGroupBar1.Groups[4].Opened then
  case CurrentItem of

    0: Fram_Finance.SaveInput;
  end ;
end;

//取消编辑操作

procedure TFrm_PrjDesign.A_cancelExecute(Sender: TObject);
begin
  if RzGroupBar1.Groups[4].Opened then
  case CurrentItem of
    0: fram_finance.CancelInput;

  end;
//  if  RzGroupBar1.Groups[2].Opened then
//  case CurrentItem of
//
//  //  2: Fram_Facility.Cacacel;
//  end
end;

 //用用户本地计算机上与所选文件相关联的应用程序打开文档文件
procedure TFrm_PrjDesign.A_opendocExecute(Sender: TObject);
begin
   if RzGroupBar1.Groups[1].Opened then
   case CurrentItem of
    0:  if not Dm_Epm.AdoQry_doc.IsEmpty then
        ExecuteFile(Dm_epm.AdoQry_doc.fieldbyname('filename').AsString,'','',SW_SHOW);
    1: if fram_bud.PageControl1.ActivePageIndex=1 then
          fram_bud.OpenBuddoc;
    2: ;
  end else
  if RzGroupBar1.Groups[3].Opened then
  case CurrentItem of
    0: if Fram_gdzc<>nil then Fram_gdzc.OpenBos;
    1: if Fram_gdzc<>nil then Fram_gdzc.OpenBos;
  end
  else if RzGroupBar1.Groups[5].Opened then
  case CurrentItem of
    0: if Fram_prjdoc<>nil then Fram_prjdoc.opendoc.Execute;

  end;
end;

// 用Autovue浏览器组件打开文档文件
procedure TFrm_PrjDesign.A_viewdocExecute(Sender: TObject);
begin
  if RzGroupBar1.Groups[1].Opened then
  case CurrentItem of
    0: if not Fram_dwg.ViewCadFile then exit;

    1: if not fram_bud.ViewBuddoc then exit;
    2: ;
  end
  else if RzGroupBar1.Groups[3].Opened then
  case CurrentItem of
    0: if Fram_gdzc<>nil then Fram_gdzc.ViewBos;
    1: if Fram_gdzc<>nil then Fram_gdzc.ViewBos;
  end
  else if RzGroupBar1.Groups[5].Opened then
  case CurrentItem of
    0: if Fram_prjdoc<>nil then Fram_prjdoc.viewdoc.Execute;

  end;
end;

// 根据所选工程项目的类型显示基本信息的标题 并初始化权限和界面
procedure TFrm_PrjDesign.FormShow(Sender: TObject);
begin
  Fram_prjbase.showfram(PrjCode);
  if prjtype='代工' then
       RzGroup1.Items[0].Caption := '代工委托单'
  else if prjtype='业扩' then
       RzGroup1.Items[0].Caption :='业扩工程概况'
  else if prjtype='业扩配套' then
       RzGroup1.Items[0].Caption := '业扩配套工程概况'
  else if prjtype='住宅配套' then
       RzGroup1.Items[0].Caption := '住宅配套工程概况'
   else if prjtype='技改' then
       RzGroup1.Items[0].Caption := '可研概况'
  else RzGroup1.Items[0].Caption := '工程概况';
  RzGroup1.Open;
  RzGroup1.Items[0].OnClick(sender);
  checkValid(0);  //
end;


//处理权限检查 { TODO -o程哨兵 -c重构 : 权限算法重新设计。 }
function TFrm_PrjDesign.CheckValid(PageIndex: Integer): Boolean;
var I:integer;
begin
  Result:= False;
  for I:=0 to ActionList1.ActionCount-1 do
  if ActionList1.Actions[I].Tag=0 then
     TAction(ActionList1.Actions[I]).Enabled:=true
  else
  begin
    if LoginUser<>Executor then
    begin
         TAction(ActionList1.Actions[I]).Enabled := Permission=5;
         if (UserDepart= '电网建设中心') then
          TAction(ActionList1.Actions[I]).Enabled := (pageindex=0) or  (pageindex=2) or (pageIndex=5);
    end else
    begin
      if (UserDepart='设计室') and ((RolName='设计员') or (RolName='预算员')) then
        TAction(ActionList1.Actions[I]).Enabled := (pageIndex=1) or (pageIndex=5) or (pageIndex=0)
      else if  (UserDepart = '工程管理科') or (UserDepart= '电网建设中心') or (RolName='多经施工员') then
        TAction(ActionList1.Actions[I]).Enabled := (pageindex=2) or (pageIndex=5)
      else if  UserDepart='财务科' then
        TAction(ActionList1.Actions[I]).Enabled:= pageindex=4
      else if  (UserDepart='线路工区') or (UserDepart='变电工区') or (UserDepart='设备运行部')  then
         TAction(ActionList1.Actions[I]).Enabled:= (pageindex=3) or
         ((pageIndex=0) and ((prjtype='代工') or (prjtype='技改')))
      else if UserDepart='营业室' then
        if pageindex=0  then
          TAction(ActionList1.Actions[I]).Enabled:=true
       else TAction(ActionList1.Actions[I]).Enabled :=false
      else  TAction(ActionList1.Actions[I]).Enabled := false;
    end;
    if  Permission=4 then
       TAction(ActionList1.Actions[I]).Enabled := true;
    if  (Permission=5) and ((pageindex=1) or (pageindex=0)) then
       TAction(ActionList1.Actions[I]).Enabled := true;
  end;


  if (framtree_task.Trvwdefaut.Selected.Level>1)
       and (framtree_task.Trvwdefaut.Selected.Parent.Text='已办箱') then
  A_finish.Enabled := false;
end;

procedure TFrm_PrjDesign.A_printExecute(Sender: TObject);
begin
  if RzGroupBar1.Groups[2].Opened then
  case CurrentItem of
    1: Fram_execontract.Printdoc;

  end;
  if RzGroupBar1.Groups[1].Opened then
  case CurrentItem of
    4: Fram_descontract.printcontract;

  end;
end;

procedure TFrm_PrjDesign.ShowAssets;
begin
  // FreeFram;
   if Fram_gdzc=nil then
   Fram_gdzc:=TFram_gdzc.Create(self);
   Fram_gdzc.Parent:=pnl_detail;
   Fram_gdzc.Align:=alclient;
   Fram_gdzc.Init(prjcode);
   Fram_gdzc.Visible:=true;
end;

procedure TFrm_PrjDesign.A_sendExecute(Sender: TObject);
begin
  frm_main.Asendprj.Execute;
end;

procedure TFrm_PrjDesign.A_finishExecute(Sender: TObject);
var tempnode:TtreeNode;
begin
  if not (executor=Loginuser) then
    showmessage('当前任务不属于您处理')
  else
  if FinishPrj(PrjCode,NodeCode) then
  begin
     ModalResult:=mrok;
     if Fram_TltBase.Visible then
      Fram_TltBase.cxTLt_com.FocusedNode.Free;
  end;
end;

procedure TFrm_PrjDesign.RzGroup1Items1Click(Sender: TObject);
begin
  FreeFram;
  if RzGroup1.items[0].Caption = '代工委托单' then
  begin
    Fram_dg:=TFram_dg.Create(self);
    Fram_dg.Parent:=panel1;
    Fram_dg.Align:=alclient;
    Panel2.Visible:= false;
    pnl_detail.Visible:=false;
    Fram_dg.Visible:=true;
    if not Frm_Main.Lsv_Task.Visible then
     Fram_dg.Initfram(Nodecode,executor,Ptaskinfo(Fram_TltBase.cxTLt_com.FocusedNode.data)^.Prjsource)
    else
      Fram_dg.Initfram(Nodecode,executor,Ptaskinfo(Frm_Main.Lsv_Task.Selected.data)^.Prjsource)
  end;
  if  ( RzGroup1.items[0].Caption = '业扩工程概况' )
     or ( RzGroup1.items[0].Caption ='业扩配套工程概况')
     or ( RzGroup1.items[0].Caption ='住宅配套工程概况')
  then
  begin
    Fram_newprj:=TFram_newprj.Create(self);
    Fram_newprj.Parent:=panel1;
    Fram_newprj.Align:=alclient;
    Panel2.Visible:= false;
    pnl_detail.Visible:=false;
    Fram_newprj.Visible:=true;
    Fram_newprj.Init(Prjcode,executor,NodeCode);
  end;
  if RzGroup1.items[0].Caption ='工程概况' then
  begin
    Fram_newnbprj:=TFram_newnbprj.Create(self);
    Fram_newnbprj.Parent:=panel1;
    Fram_newnbprj.Align:=alclient;
    Panel2.Visible:= false;
    pnl_detail.Visible:=false;
    Fram_newnbprj.Visible:=true;
    Fram_newnbprj.Init(Prjcode,executor,NodeCode);
  end;
  
  if RzGroup1.items[0].Caption= '可研概况' then
  begin
    fram_kybg:=Tfram_kybg.Create(self);
    fram_kybg.Parent:=panel1;
    fram_kybg.Align:=alclient;
    A_save.Enabled:= true;
    Panel2.Visible:= false;
    pnl_detail.Visible:=false;
    fram_kybg.Visible:=true;
    fram_kybg.Init(Prjcode,executor,NodeCode);
   end;
  CurrentItem:=0;
end;

procedure TFrm_PrjDesign.RzGroup2Items0Click(Sender: TObject);
begin
  FreeFram;
  Fram_Dwg:=TFram_Dwg.Create(self);
  Fram_Dwg.Init(PrjCode);
  ShowDetailFram(Fram_Dwg);
  CurrentItem:=0;
end;

procedure TFrm_PrjDesign.RzGroup2Items1Click(Sender: TObject);
begin
  FreeFram;
  CurrentItem:=1;

    Fram_bud:=TFram_budget.Create(self);
    Fram_bud.Init(PrjCode);

  ShowDetailFram(Fram_bud);
end;

procedure TFrm_PrjDesign.RzGroup2Items4Click(Sender: TObject);
begin
  FreeFram;
  CurrentItem:=4;
  Fram_Descontract:=TFram_Descontract.Create(self);
  Fram_Descontract.Init(PrjCode);
  ShowDetailFram(Fram_Descontract);
end;

procedure TFrm_PrjDesign.RzGroup3Items0Click(Sender: TObject);
begin
  FreeFram;
  Fram_prjPlan:=TFram_prjplan.Create(self);
  Fram_prjPlan.Init(PrjCode);
  ShowDetailFram(Fram_prjPlan);
  CurrentItem:=0;
end;

procedure TFrm_PrjDesign.RzGroup3Items1Click(Sender: TObject);
begin
  FreeFram;
  Fram_Execontract:=TFram_Execontract.Create(self);
  Fram_Execontract.Init(PrjCode);
  ShowDetailFram(Fram_Execontract);
 { ExecuteFile('http://10.31.191.251/userlogin.asp?username=300381&password=','','',SW_SHOW); }
  CurrentItem:=1;
end;

procedure TFrm_PrjDesign.RzGroup4Items0Click(Sender: TObject);
begin
  FreeFram;
  Fram_Prjcheck := TFram_Prjcheck.Create(self);
  Fram_Prjcheck.Init(PrjCode,copy(RzGroup4.Items[0].Caption,1,4));       //hesupeace@sina.com
  ShowDetailFram(Fram_Prjcheck);
  CurrentItem:=0;
end;

procedure TFrm_PrjDesign.RzGroup4Items1Click(Sender: TObject);
begin
  FreeFram;
  Fram_Prjcheck := TFram_Prjcheck.Create(self);
  Fram_Prjcheck.Init(PrjCode,copy(RzGroup4.Items[1].Caption,1,4));       //hesupeace@sina.com
  ShowDetailFram(Fram_Prjcheck);

  CurrentItem := 1;
end;

procedure TFrm_PrjDesign.RzGroup5Items0Click(Sender: TObject);
begin
  FreeFram;
  Fram_Finance := TFram_Finance.Create(self);
  Fram_Finance.Init(PrjCode);
  ShowDetailFram(Fram_Finance);
  CurrentItem:= 0;
end;

procedure TFrm_PrjDesign.RzGroup6Items0Click(Sender: TObject);
begin
  FreeFram;
  Fram_PrjDoc := TFram_PrjDoc.Create(self);
  Fram_PrjDoc.Init(PrjCode);
  ShowDetailFram(Fram_PrjDoc);
  CurrentItem:=0;
end;

procedure TFrm_PrjDesign.RzGroup6Items1Click(Sender: TObject);
begin
  FreeFram;
  Frame_remark := TFrame_remark.Create(self);
  Frame_remark.Init(PrjCode);
  ShowDetailFram(Frame_remark);
  CurrentItem:= 1;
end;

procedure TFrm_PrjDesign.RzGroup6Items2Click(Sender: TObject);
begin
  FreeFram;
  Fram_NodePlan := TFram_NodePlan.Create(self);
  Fram_NodePlan.GetNodeplan(PrjCode);
  ShowDetailFram(Fram_NodePlan);
  CurrentItem := 2;
end;

procedure TFrm_PrjDesign.RzGroup6Items3Click(Sender: TObject);
begin
  {FreeFram;
  {Fram_flowtrace := TFram_flowtrace.Create(self);
  Fram_flowtrace.GetFlowTrace(PrjCode);
  ShowDetailFram(Fram_flowtrace);
  CurrentItem :=  3; }
end;

procedure TFrm_PrjDesign.RzGroup6Items4Click(Sender: TObject);
begin
  FreeFram;
  Fram_gante := TFram_gante.Create(self);
  Fram_gante.GenerateGantte(PrjCode);
  ShowDetailFram(Fram_gante);
  CurrentItem:=4;
end;

procedure TFrm_PrjDesign.RzGroup6Items5Click(Sender: TObject);
begin
  FreeFram;
  Fram_Log := TFram_Log.Create(self);
  Fram_Log.Init(PrjCode);
  ShowDetailFram(Fram_Log);
  CurrentItem:=5;
end;

procedure TFrm_PrjDesign.RzGroup1Open(Sender: TObject);
begin
  CheckValid(TRzGroup(Sender).GroupIndex) ;
end;

procedure TFrm_PrjDesign.RzGroup5Items1Click(Sender: TObject);
var Parentprj:string;
begin
  QryWork(Dm_Epm.adoqry_pub,'select parentcode from projectinfo where prjcode='''+PrjCode+'''');
  Parentprj:=  Dm_Epm.adoqry_pub.fieldbyname('parentcode').AsString ;
  if Parentprj='' then Parentprj:=prjcode;
  FreeFram;
  FFram_GetFee := TFram_GetFee.Create(self);
  FFram_GetFee.Init(Parentprj);
  ShowDetailFram(FFram_GetFee);
  CurrentItem:= 1;
end;

end.

