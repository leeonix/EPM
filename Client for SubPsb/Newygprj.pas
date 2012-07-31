unit Newygprj;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,dm,pubvar, ExtCtrls, ComCtrls, Buttons;

type
  TFram_NewygPrj = class(TFrame)
    Label3: TLabel;
    PRJTYPE: TComboBox;
    PRJNAME: TEdit;
    Label4: TLabel;
    Label2: TLabel;
    PRJACCOUNT: TEdit;
    OTHERTYPE: TComboBox;
    Label5: TLabel;
    DESIGNCOMPANY: TComboBox;
    Label6: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    ygzhpfrq: TEdit;
    ygsqrq: TEdit;
    Label12: TLabel;
    prjadd: TEdit;
    Bevel1: TBevel;
    Bevel3: TBevel;
    parentcode: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    parentprjacc: TEdit;
    Label10: TLabel;
    SpeedButton1: TSpeedButton;
    Bevel2: TBevel;
    corpcode: TEdit;
    procedure ygsqrqDblClick(Sender: TObject);
    procedure DESIGNCOMPANYEnter(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    prjacc:string;
    { Private declarations }
  public
    Inputmode:integer;
    projectsouce   :string;
    newexecutor    :string;
    projectcode :string;
    ParentPrj:string;
    ParentExecutor:string;
    ParentNodecode:string;
    procedure CreateNew();
    procedure Init(const Prjcode,executor,Node:string);
    function SaveInfo:Boolean;
    { Public declarations }
  end;


implementation

uses newitem, tasktree, MAIN,prj_design, PrjAcount;

{$R *.dfm}

var Frm_PrjDesign2:TFrm_PrjDesign;

 //初始化用改工程信息
procedure TFram_NewygPrj.Init(const Prjcode, executor, Node: string);
var csql:string;
begin
  projectcode:=prjcode;
  csql:='select * from projectinfo where prjcode='''+Prjcode+'''';
  Loaddata(dm_epm.adoqry_pub,csql,self);
  prjacc:=trim(prjaccount.Text);
  ParentPrj:=trim(parentcode.text);
  csql:='select prjaccount,Executor,Nodecode from projectinfo a inner join flownodeinfo b on '
         +'a.prjcode=b.xmdm  where prjcode='''+ParentPrj+''' and activeflag=''1''';
  qrywork(dm_epm.adoqry_pub,csql);
  parentprjacc.Text:= dm_epm.adoqry_pub.fieldbyname('prjaccount').AsString;
  ParentExecutor:=dm_epm.adoqry_pub.fieldbyname('Executor').AsString;;
  ParentNodecode:=dm_epm.adoqry_pub.fieldbyname('Nodecode').AsString;;
  if (executor=Loginuser)or (LoginUser='马小丽' ) then
     inputmode:=EditMode
  else   inputmode:=BroswerMode;
  if PRJTYPE.Text='007' then
     PRJTYPE.Text:='用改(业扩)'
  else if prjtype.Text='008' then
     prjtype.Text:='用改';
end;

procedure TFram_NewygPrj.ygsqrqDblClick(Sender: TObject);
begin
  (sender as Tedit).Text:=getclendar;
end;

procedure TFram_NewygPrj.DESIGNCOMPANYEnter(Sender: TObject);
begin
   Dm_epm.InitCombobox(Tcombobox(sender));
end;

procedure TFram_NewygPrj.CreateNew;
var cSql:string;
begin
  csql:='select * from projectinfo where prjcode='''+parentprj+'''';
  qrywork(dm_epm.adoqry_pub,csql);
  prjadd.Text:=dm_epm.adoqry_pub.fieldbyname('prjadd').asstring;
  prjname.Text:=dm_epm.adoqry_pub.fieldbyname('prjname').asstring;
  DESIGNCOMPANY.Text:=dm_epm.adoqry_pub.fieldbyname('DESIGNCOMPANY').asstring;
end;

function TFram_NewygPrj.SaveInfo:Boolean;
function CheckInput():Boolean;
var csql:string;
begin
   Result:=False;
   if trim(prjname.Text)='' then
   begin
     showmessage('请输入工程名称');
     prjname.SetFocus;
     prjname.SelectAll;
     exit;
   end;
   if Prjacc<>trim(Prjaccount.Text) then
   begin
     csql:='select *  from projectinfo where prjaccount='''+trim(prjaccount.text)+'''';
     QryWork(dm_epm.adoqry_pub,csql);
     if not  dm_epm.adoqry_pub.IsEmpty then
     begin
       showmessage('工程帐号不可以重复，请检查工程帐号');
       prjaccount.SetFocus;
       exit;
     end;
   end;
   Result:=true;
end;

var ctemp,csql:string;
    Executors:TstringList;
begin
  Result:=false;
  if not CheckInput then
    exit;
  if inputmode=NewMode then
  begin
    if trim(prjadd.Text)='' then
    begin
      showmessage('请输入工程地址');
      prjadd.SetFocus;
      prjadd.SelectAll;
      exit;
    end;
    try
      csql:='select * from projectinfo';
      ctemp:=dm_epm.GetnewitemNo('P007');
      PRJTYPE.Text:='007';
      corpcode.Text := CurCorpCode;
      Parentcode.Text:=parentprj;
      inputalldata(csql,ctemp,'prjcode',self);
      Executors:=TstringList.Create;
      Executors.Add(Loginuser);
      settasknode(ctemp,'060100','',Executors);
      Executors.Free;
    except
      showmessage('不能保存数据');
      exit;
    end;
    dm_epm.generatworkplan(ctemp,'06',gettime);
    dm_epm.setflowlog(ctemp,'','新建业扩带用改工程','060100',loginuser,nil);
    frm_new.modalresult:=mrok;
    showmessage('数据保存成功');
    frm_new.ModalResult:=mrok;
    frm_main.Arefresh.Execute;
  end else
  if inputmode=EditMode then
  begin
    csql:='select * from ProjectInfo';
    if prjtype.Text='用改(业扩)' then
    PRJTYPE.Text := '007'
    else  PRJTYPE.Text := '008' ;
    inputalldata(csql,ProjectCode,'PrjCode',self);
    if prjtype.Text='007' then
         PRJTYPE.Text:='用改(业扩)'
    else prjtype.Text:='用改';
    showmessage('数据保存成功');
  end;
  Result := True;
end;

procedure TFram_NewygPrj.SpeedButton1Click(Sender: TObject);
begin
  Application.CreateForm(TFrm_PrjDesign,Frm_PrjDesign2);
   try
     Frm_PrjDesign2.PrjCode := parentprj;
     Frm_PrjDesign2.Executor := ParentExecutor;
     Frm_PrjDesign2.NodeCode := ParentNodecode;
     Frm_PrjDesign2.prjtype := '业扩';
     Frm_PrjDesign2.FormStyle:=fsStayOnTop;
   //  Frm_PrjDesign2.ToolButton17.Enabled:=false;
     Frm_PrjDesign2.ShowModal;
   finally
     Frm_PrjDesign2.Free; 
   end;
end;

end.
