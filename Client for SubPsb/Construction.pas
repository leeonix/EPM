unit Construction;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls,dm,pubvar, Grids, DBGrids, OleCtrls,FmxUtils,
  AUTOVUEXLib_TLB, DB, ADODB;

type
  TFram_Contruction = class(TFrame)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Bevel2: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Label7: TLabel;
    Bevel6: TBevel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    ysrq: TEdit;
    bhg: TRadioButton;
    hg: TRadioButton;
    yl: TRadioButton;
    ysqk: TMemo;
    StaticText1: TStaticText;
    xlmc1: TLabeledEdit;
    xlmc2: TLabeledEdit;
    xlgbmc1: TLabeledEdit;
    xlgbmc2: TLabeledEdit;
    zjdyxlcd2: TLabeledEdit;
    zjxlcd2: TLabeledEdit;
    zjdyxlcd1: TLabeledEdit;
    zjxlcd1: TLabeledEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    sgbz: TComboBox;
    sgrq: TEdit;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    ylsm: TRichEdit;
    sbysr: TComboBox;
    sbyskh: TComboBox;
    sbyssh: TComboBox;
    sjswcqk: TCheckBox;
    TabSheet3: TTabSheet;
    Label11: TLabel;
    bdsgdw: TComboBox;
    Label12: TLabel;
    kgrq: TEdit;
    Label13: TLabel;
    jgrq: TEdit;
    Label14: TLabel;
    bdyl: TRadioButton;
    bdhg: TRadioButton;
    bdbhg: TRadioButton;
    bdysqk: TMemo;
    Label15: TLabel;
    StaticText6: TStaticText;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Bevel9: TBevel;
    Bevel10: TBevel;
    Bevel8: TBevel;
    bdysbm: TComboBox;
    Label19: TLabel;
    Label20: TLabel;
    bdysrq: TEdit;
    Label21: TLabel;
    Bevel7: TBevel;
    Bevel11: TBevel;
    Bevel12: TBevel;
    Bevel13: TBevel;
    bdysr: TComboBox;
    bdysbz: TComboBox;
    bdysjh: TComboBox;
    Label22: TLabel;
    Label23: TLabel;
    bdzjly: TEdit;
    bdpztz: TEdit;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Bevel14: TBevel;
    bdsjtz: TEdit;
    bdsbjz: TEdit;
    bdftlx: TEdit;
    bdyjzc: TEdit;
    bdcljz: TEdit;
    bdrgfy: TEdit;
    bdqtfy: TEdit;
    Bevel15: TBevel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    jhbmtbr: TComboBox;
    cwbmtbr: TComboBox;
    jhtbrq: TEdit;
    cwtbrq: TEdit;
    Bevel16: TBevel;
    bdsbzc: TRichEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    dlzlqq: TCheckBox;
    Label37: TLabel;
    dlzlsdrq: TEdit;
    Label38: TLabel;
    dlzljsr: TEdit;
    Panel4: TPanel;
    AutoVueX1: TAutoVueX;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Adoqry_dljgd: TADOQuery;
    procedure Button1Click(Sender: TObject);
    procedure sgrqDblClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure sgbzEnter(Sender: TObject);
    procedure sbysrEnter(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure bdsgdwEnter(Sender: TObject);
    procedure bdysrEnter(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Adoqry_dljgdAfterScroll(DataSet: TDataSet);
    procedure Adoqry_dljgdBeforePost(DataSet: TDataSet);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    Projectid,Projectname:string;
    Inputmode:Integer;
    procedure Init(const Prjcode,Executor,Node,Prjname:string);
    procedure InitCombox(TagetComBobox:TComBobox);
     { Public declarations }
  end;

implementation

uses Tasktree, Main;
{$R *.dfm}

{ Tfram_contruction }



procedure TFram_Contruction.Init(const Prjcode, Executor, Node,
  Prjname: string);
var cSql:string;
begin
  Projectid:=PrjCode;
  ProjectName:=PrjName;
  cSql:='select * from xlys where prjcode='''+Prjcode+'''';
  Loaddata(Dm_epm.adoqry_pub,csql,self,1);
  csql:='select * from bdys where prjcode='''+Prjcode+'''';
  Loaddata(dm_epm.adoqry_pub,csql,self,2);
  csql:='select * from dlys where prjcode='''+Prjcode+'''';
  Loaddata(dm_epm.adoqry_pub,csql,self,3);
  Adoqry_dljgd.Active:=false;
  Adoqry_dljgd.Parameters.ParamByName('mycode').Value:=prjcode;
  Adoqry_dljgd.Active:=true;
  if (Executor=Loginuser) and (Userdepart='线路工区') then
  begin
    Inputmode:=EditMode;
    Button1.Enabled:=true;
    Button3.Enabled:=true;
    Button4.Enabled:=false;
    Button6.Enabled:=false;
    Button7.Enabled:=false;
    Button9.Enabled:=false;
  end else
  if (Executor=Loginuser) and (Userdepart='变电工区') then
  begin
    Inputmode:=EditMode;
    Button1.Enabled:=False;
    Button3.Enabled:=False;
    Button4.Enabled:=True;
    Button6.Enabled:=True;
    Button7.Enabled:=false;
    Button9.Enabled:=false;
  end else
  if (Executor=Loginuser) and (Userdepart='工程管理科') then
  begin
    Inputmode:=EditMode;
    Button1.Enabled:=False;
    Button3.Enabled:=False;
    Button4.Enabled:=false;
    Button6.Enabled:=false;
    Button7.Enabled:=True;
    Button9.Enabled:=True;
  end else
  begin
    InputMode:=BroswerMode;
    Button1.Enabled:=false;
    Button3.Enabled:=false;
    Button4.Enabled:=false;
    Button6.Enabled:=false;
  end;
  //lbl_prjname.Caption:=Prjname;
  //lbl_prjacc.Caption:=ptaskinfo(frm_main.Lsv_Task.Selected.Data)^.prjacc;
  //panel1.Caption:=panel1.caption+'   工程名称:'+prjname;
end;

procedure TFram_Contruction.Button1Click(Sender: TObject);
var csql:string;
begin
  if trim(sgbz.Text)<>'' then
     dm_epm.InsertParam('sgbz',sgbz.Text);
  if trim(sbysr.Text)<>'' then
     dm_epm.InsertParam('sbysr',sbysr.Text);
  if trim(sbyskh.Text)<>'' then
     dm_epm.InsertParam('sbyskh',sbyskh.Text);
  if trim(sbyssh.Text)<>'' then
     dm_epm.InsertParam('sbyssh',sbyssh.Text);
  csql:='select * from xlys ';
  if inputmode=EditMode then
  begin
    inputalldata(csql,projectid,'prjcode',self,1);
  end;
  showmessage('数据保存成功');
  //postmessage(framtree_task.Handle,Wm_upnode,0,0);
end;

procedure TFram_Contruction.sgrqDblClick(Sender: TObject);
begin
   (sender as Tedit).Text:=getclendar;
end;

procedure TFram_Contruction.Button3Click(Sender: TObject);
begin
//
end;

procedure TFram_Contruction.sgbzEnter(Sender: TObject);
var ctemp:string;
begin
   cTemp:=sgbz.Text;
   DM_epm.InitParam(sgbz,'sgbz','');
   sgbz.DroppedDown :=True;
   sgbz.Text:=cTemp;
end;

procedure TFram_Contruction.sbysrEnter(Sender: TObject);
var ctemp:string;
begin
   cTemp:=(sender as Tcombobox).Text;
   DM_epm.InitParam(Tcombobox(sender),Tcombobox(sender).name,'');
   Tcombobox(sender).DroppedDown :=True;
   Tcombobox(sender).Text:=cTemp;
end;

procedure TFram_Contruction.Button4Click(Sender: TObject);
var cSql:string;
begin
  if Trim(bdsgdw.Text)<>'' then
     dm_epm.InsertParam('bdsgdw',bdsgdw.Text);
  if Trim(bdysbm.Text)<>'' then
     Dm_epm.InsertParam('bdysbm',bdysbm.Text);
  if Trim(bdysr.Text)<>'' then
     Dm_epm.InsertParam('bdysr',bdysr.Text);
  if Trim(bdysbz.Text)<>'' then
     Dm_epm.InsertParam('bdysbz',bdysbz.Text);
  if Trim(bdysjh.Text)<>'' then
     Dm_epm.InsertParam('bdysjh',bdysjh.Text);
  if Trim(jhbmtbr.Text)<>'' then
     Dm_epm.InsertParam('jhbmtbr',jhbmtbr.Text);
  if Trim(cwbmtbr.Text)<>'' then
     Dm_epm.InsertParam('cwbmtbr',cwbmtbr.Text);
  cSql:='select * from bdys ';
  if InputMode=EditMode then
  begin
    InputAllData(cSql,ProjectId,'prjcode',self,2);
  end;
  Showmessage('数据保存成功');
end;

procedure TFram_Contruction.Button6Click(Sender: TObject);
begin
  //
end;

procedure TFram_Contruction.bdsgdwEnter(Sender: TObject);
var ctemp:string;
begin
   cTemp:=bdsgdw.Text;
   DM_epm.InitParam(bdsgdw,'bdsgdw','');
   bdsgdw.DroppedDown :=True;
   bdsgdw.Text:=cTemp;
end;

procedure TFram_Contruction.InitCombox(TagetComBobox: TComBobox);
var cTemp:string;
begin
  cTemp:= TagetComBobox.Text;
  DM_epm.InitParam(TagetComBobox,TagetComBobox.Name,'');
  TagetComBobox.DroppedDown  := True;
  TagetComBobox.Text:=cTemp;
end;

procedure TFram_Contruction.bdysrEnter(Sender: TObject);
begin
  InitCombox(Tcombobox(sender));
end;

procedure TFram_Contruction.Button9Click(Sender: TObject);
var desfile:string;
begin
  with Dm_epm do
  begin
     if opendlg.Execute then
     begin
       Adoqry_dljgd.Append;
       desfile:=filepath+loginuser+'\电缆竣工单\'+Projectid+'电缆竣工单'+extractfileext(opendlg.FileName);
       Adoqry_dljgd.FieldByName('version').AsString:='1';
       Adoqry_dljgd.FieldByName('createby').AsString:=loginuser;
       Adoqry_dljgd.FieldByName('DOCTYPE').AsString:='电缆竣工单';
       Adoqry_dljgd.FieldByName('docname').AsString:=ProjectName+'电缆竣工单';{ TODO : 要处理预算书类型的问题 }
       copyfile(opendlg.FileName,desfile);
       Adoqry_dljgd.FieldByName('filename').AsString:=desfile;
       Adoqry_dljgd.Post;
       Adoqry_dljgd.Refresh;
       AutoVueX1.SRC:=desfile;
     end;
  end;
end;

procedure TFram_Contruction.Adoqry_dljgdAfterScroll(DataSet: TDataSet);
begin
  AutoVueX1.SRC:=dataset.fieldbyname('filename').AsString;
end;

procedure TFram_Contruction.Adoqry_dljgdBeforePost(DataSet: TDataSet);
begin
  adoqry_dljgd.FieldByName('ssxmdm').AsString:=projectid;
end;

procedure TFram_Contruction.Button7Click(Sender: TObject);
var cSql:string;
begin
  csql:='select * from dlys ';
  if inputmode=EditMode then
  begin
    inputalldata(csql,projectid,'prjcode',self,3);
  end;
  showmessage('数据保存成功');
end;

end.
