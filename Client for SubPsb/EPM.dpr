program EPM;
uses
  Forms,
  Dialogs,
  ShellAPI,
  Controls,
  sysutils,
  WINDOWS,
  Main in 'Main.pas' {Frm_Main},
  newitem in 'newitem.pas' {Frm_New},
  Browser in 'Browser.pas' {Fram_Browser: TFrame},
  framdgwt in 'framdgwt.pas' {Fram_dg: TFrame},
  Dm in 'Dm.pas' {Dm_Epm: TDataModule},
  prjbrowser in 'prjbrowser.pas' {Framtree_browser: TFrame},
  tasktree in 'tasktree.pas' {Framtree_Task: TFrame},
  Login in 'Login.pas' {Frm_Login},
  pubvar in 'pubvar.pas',
  searchtree in 'searchtree.pas' {Framtree_Search: TFrame},
  flowcontrol in 'flowcontrol.pas' {Frm_FlowControl},
  newprj in 'newprj.pas' {Fram_NewPrj: TFrame},
  Engdoc in 'Engdoc.pas' {Fram_Dwg: TFrame},
  Budget in 'Budget.pas' {Fram_Budget: TFrame},
  newdoc in 'newdoc.pas' {Frm_NewDoc},
  setpwd in 'setpwd.pas' {Frm_ModPwd},
  finance in 'finance.pas' {Fram_Finance: TFrame},
  frmplan in 'frmplan.pas' {Frm_Plan},
  Getclendar in 'Getclendar.pas' {Frm_GetClendar},
  selectcontract in 'selectcontract.pas' {Frm_Selectcontract},
  Baseinfo_xt in 'Baseinfo_xt.pas' {Fram_NewNbPrj: TFrame},
  Documents in 'Documents.pas' {Fram_PrjDoc: TFrame},
  prjremark in 'prjremark.pas' {Frame_remark: TFrame},
  Contract in 'Contract.pas' {Frm_Contract},
  BudDoc in 'BudDoc.pas' {Frm_buddoc},
  Prj_jgys in 'Prj_jgys.pas' {Frame_Jgys: TFrame},
  Assets in 'Assets.pas' {Fram_gdzc: TFrame},
  Asset_add in 'Asset_add.pas' {Frm_AddAssets},
  ReportManag in 'ReportManag.pas' {Frm_report},
  Prj_Design in 'Prj_Design.pas' {Frm_PrjDesign},
  Prjbase in 'Prjbase.pas' {Fram_prjbase: TFrame},
  Viewdoc in 'Viewdoc.pas' {Frm_Viewdoc},
  BudgetInput in 'BudgetInput.pas' {Frm_InputBud},
  newygprj in 'newygprj.pas' {Fram_NewygPrj: TFrame},
  PrjPlan in 'PrjPlan.pas' {Fram_Prjplan: TFrame},
  PrjExecontract in 'PrjExecontract.pas' {Fram_Execontract: TFrame},
  PrjCheck in 'PrjCheck.pas' {Fram_prjcheck: TFrame},
  NodePlan in 'NodePlan.pas' {Fram_Nodeplan: TFrame},
  PrjGantte in 'PrjGantte.pas' {Fram_gante: TFrame},
  Search in 'Search.pas' {frm_search},
  exportfield in 'exportfield.pas' {frm_export},
  Setparam in 'Setparam.pas' {frm_setpara},
  Prj_bdys in 'Prj_bdys.pas' {Fram_bdys: TFrame},
  Sumcondition in 'Sumcondition.pas' {frm_sumcondition},
  designcontract in 'designcontract.pas' {Fram_descontract: TFrame},
  treefram in 'treefram.pas' {Fram_Tree: TFrame},
  kybg in 'kybg.pas' {Fram_kybg: TFrame},
  Udelayprj in 'Udelayprj.pas' {frm_Delayprj},
  PrjAcount in 'PrjAcount.pas' {frm_GenPrjacc},
  subPrjAcc in 'subPrjAcc.pas' {fram_subprjacc: TFrame},
  NewDesignPrj in 'NewDesignPrj.pas' {fram_designprj: TFrame},
  UFindPrj in 'UFindPrj.pas' {frm_findprj},
  Materal in 'Materal.pas' {Fram_Mat: TFrame},
  TreeListprj in 'TreeListprj.pas' {Fram_TltBase: TFrame},
  Fmxutils in '..\Common\Fmxutils.pas',
  Flowlog in 'Flowlog.pas' {Fram_log: TFrame},
  FlowTrace in 'FlowTrace.pas' {Fram_FlowTrace: TFrame},
  MatInput in 'MatInput.pas' {frm_SelectMat},
  MyReport in '..\Common\MyReport.pas',
  UMD5 in '..\MD5\UMD5.pas',
  frm_sgdw in 'frm_sgdw.pas' {frm_contractcompany},
  DelayContract in 'DelayContract.pas' {frm_DelayContract},
  frmDelayDate in 'frmDelayDate.pas' {frm_DateRange},
  frm_exportcontractlist in 'frm_exportcontractlist.pas' {frm_contractlist},
  importbudget in 'importbudget.pas' {frm_importbudget},
  Jffzr in 'Jffzr.pas' {frm_jffzr},
  importwtdesign in 'importwtdesign.pas' {frm_ImportWtDesign},
  Sjimport in 'Sjimport.pas' {frm_importSj},
  Gspfimport in 'Gspfimport.pas' {frm_importGspf},
  JsReport in 'JsReport.pas' {frm_jsreport},
  frm_designcompany in 'frm_designcompany.pas' {frm_sjdw},
  Chdw in 'Chdw.pas' {frm_chdw},
  jldw in 'jldw.pas' {frm_jldw};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Easy Project';

  Application.CreateForm(TFrm_Main, Frm_Main);
  //Frm_Main.WebUpdateWizard1.Execute;
  Application.CreateForm(TDm_Epm, Dm_Epm);
  Application.CreateForm(TFrm_Login, Frm_Login);
    if frm_Login.ShowModal=mrcancel then
    begin
      Frm_main.free;
      Application.Terminate;
    end;
  if Date>StrToDate('2013-07-01') then
  begin
    ShowMessage('Autovue license is invalid ,Plese check the newest license policy');
     Application.Terminate;
  end;

  //Application.CreateForm(Tfrm_Delayprj,frm_Delayprj);
  Application.CreateForm(Tfrm_DelayContract,frm_DelayContract);
  Application.CreateForm(TFramtree_Task,Framtree_Task);
  Application.CreateForm(TFramtree_browser,Framtree_browser);
  Application.CreateForm(TFramtree_Search,Framtree_Search);
  Application.CreateForm(Tfrm_search,frm_search);
  Application.CreateForm(TFram_TltBase,Fram_TltBase);

  frm_login.Free;
  Application.Run;
end.
