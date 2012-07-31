unit NewPrj;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,StrUtils,
  StdCtrls,dm,pubvar, ExtCtrls, ComCtrls, Buttons;

type
  TFram_NewPrj = class(TFrame)
    Label3: TLabel;
    cbb_prjtype: TComboBox;
    PRJNAME: TEdit;
    Label4: TLabel;
    Label2: TLabel;
    PRJACCOUNT: TEdit;
    Label5: TLabel;
    DESIGNCOMPANY: TComboBox;
    Label6: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    yysfje: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    lxr: TEdit;
    lxdh: TEdit;
    Label10: TLabel;
    ZJRL: TEdit;
    DYDJ: TComboBox;
    Label11: TLabel;
    yysfrq: TEdit;
    Bevel2: TBevel;
    Label13: TLabel;
    Bevel4: TBevel;
    prjadd: TEdit;
    Label12: TLabel;
    SLYYY: TEdit;
    parentcode: TEdit;
    Corpcode: TEdit;
    btn_genprjacc: TButton;
    path: TEdit;
    prjtype: TEdit;
    procedure yysfrqDblClick(Sender: TObject);
    procedure DESIGNCOMPANYEnter(Sender: TObject);
  //  procedure SpeedButton1Click(Sender: TObject);
//    procedure SpeedButton2Click(Sender: TObject);
    procedure btn_genprjaccClick(Sender: TObject);
    procedure cbb_prjtypeChange(Sender: TObject);

  private
    prjacc:string;
    projectcode:string;
    FrefcodeList:TStringList;
    function GenerateYgPrj(const ParentCode: string;
      var prjcode: string): Boolean;
    { Private declarations }
  public
    InputMode:integer;
    Ygprjcode: string;
    YgExecutor:string;
    YgNodecode:string;
    Newexecutor:string;
    Parentprj:string;
    Yktype:Integer;
   // function GenerateInterPrj(const prjcode,CustomerName:string):Boolean;
    function GeneratePrj(PrjAcc:string):Boolean;
    procedure Init(const Prjcode,executor,Node:string);
    procedure FillInProjectType();
    function SaveInfo():Boolean;
    function Createsubprj: Boolean;
    { Public declarations }
  end;

implementation

uses newitem, tasktree, MAIN,prj_design, PrjAcount, frmCIPrj;

{$R *.dfm}

var Frm_PrjDesign2:TFrm_PrjDesign;


function TFram_NewPrj.Createsubprj: Boolean;
var Csql:string;
begin
  csql:='select * from projectinfo  where  prjcode='''+Parentprj+'''';
  Loaddata(dm_epm.adoqry_pub,csql,self);
  PRJTYPE.Text := '业扩';
  Prjacc:=trim(prjaccount.Text);
 // path.Text :=
  Parentcode.Text:=parentprj;
  Yktype := 6;
end;

procedure TFram_NewPrj.Init(const Prjcode, executor, Node: string);
var csql:string; I:Integer;
begin
  ProjectCode := Prjcode;
  csql := 'select * from projectinfo  where prjcode='''+Prjcode+'''';
  LoadData(dm_epm.adoqry_pub,csql,self,0);
  PrjAcc := trim(prjaccount.Text);
//  csql:='select prjcode,prjaccount,Executor,Nodecode from projectinfo a inner join flownodeinfo b on '
//         +'a.prjcode=b.xmdm  where Parentcode='''+Prjcode+''' and activeflag=''1''';
//  qrywork(dm_epm.adoqry_pub,cSql);
//  if not  dm_epm.adoqry_pub.IsEmpty then
//  begin
//   // Panel1.Visible := true;    //
//   // HASYGPRJ.Checked:=true;
//    //ygprjaccount.Text := dm_epm.adoqry_pub.fieldByName('prjaccount').AsString;
//    YgPrjcode := dm_epm.adoqry_pub.fieldByName('prjcode').AsString;
//    YgExecutor := dm_epm.adoqry_pub.fieldByName('Executor').AsString;
//    YgNodecode := dm_epm.adoqry_pub.fieldByName('Nodecode').AsString;
//  end  ;
  //else  Panel1.Visible := false;
  if (executor=Loginuser)or (LoginUser='马小丽' ) then
  begin
     inputmode := EditMode;
     btn_genprjacc.Enabled :=(node='040100') ;  
     if node='040302' then
     begin
      yysfrq.enabled := true;
      yysfje.Enabled := true;
     end else
     begin
       yysfrq.Enabled := false;
       yysfje.Enabled := false;
     end;
  end else
  begin
    yysfrq.Enabled := false;
    yysfje.Enabled := false;
    InputMode := BroswerMode;
    Btn_GenPrjacc.Enabled :=False;
  end;
  if  (Permission=SysAdmin) or (userdepart='电网建设中心') then
  begin

     InputMode:=EditMode;
  end;
  if prjtype.Text='002' then   Yktype := 0;
  if prjtype.Text='007' then   Yktype := 5;
  if prjtype.Text='010' then   Yktype := 4;
  FillInProjectType;
 
end;

procedure TFram_NewPrj.cbb_prjtypeChange(Sender: TObject);
begin
   prjtype.Text :=  FrefcodeList.Strings[cbb_prjtype.ItemIndex] ;
end;

procedure TFram_NewPrj.yysfrqDblClick(Sender: TObject);
begin
  (sender as Tedit).Text:=GetClendar;
end;

procedure TFram_NewPrj.DESIGNCOMPANYEnter(Sender: TObject);
begin
   Dm_epm.InitCombobox(Tcombobox(sender));
end;

procedure TFram_NewPrj.FillInProjectType;
var csql :string;
    I:Integer;
begin
    FrefcodeList:= Tstringlist.Create;
    cbb_prjtype.Items.Clear;
    csql := 'select TYPENAME,PRJTYPECODE from PROJECTTYPE';
    QryWork(Dm_Epm.adoqry_pub,csql);
    for I :=0  to Dm_Epm.adoqry_pub.Recordcount-1  do
    begin
      cbb_prjtype.Items.Add(trim(Dm_Epm.adoqry_pub.fieldbyname('TYPENAME').asstring));
      FrefcodeList.Add(trim(Dm_Epm.adoqry_pub.fieldbyname('PRJTYPECODE').asstring));
      Dm_Epm.adoqry_pub.Next;
    end;
    if Yktype=0 then    cbb_prjtype.ItemIndex := 1;
    if Yktype=4 then    cbb_prjtype.ItemIndex := 7;
    if Yktype=5 then    cbb_prjtype.ItemIndex := 5;

end;

function TFram_NewPrj.GenerateYgPrj(const ParentCode: string;var prjcode:string): Boolean;
var Csql,ctemp:string;
begin
  Result := false;
  ctemp := Dm_epm.GetnewitemNo('P007');
  try
    csql := 'Insert into Projectinfo(prjcode,PrjName,Prjtype,PrjAdd,Designcompany,ParentCode)'
             +' Values('''+Ctemp+''','''+Trim(PRJNAME.Text)+''',''007'','
             +''''+Trim(PrjAdd.Text)+''','''+Trim(DesignCompany.Text)+''','''+ParentCode+''')';
    QryWork(Dm_Epm.Adoqry_pub,Csql,false);
    Dm_epm.GeneratWorkplan(ctemp,'04',GetTime);
    Dm_epm.SetflowLog(ctemp,'','新建用改（业扩）项目',
                            '040100',loginuser,nil);

  except
    ShowMessage('不能保存数据');
    Exit;
  end;
  prjcode:=ctemp;
  Result := true;
end;

function TFram_NewPrj.SaveInfo:Boolean;
function CheckInput():Boolean;
var csql:string;
begin
   Result:=False;
   if trim(PRJACCOUNT.Text)='' then
   begin
     showmessage('请输入工程帐号');
     prjaccount.SetFocus;
     exit;
   end else
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
   if trim(prjadd.Text)='' then
   begin
     showmessage('请输入工程地址');
     prjadd.SetFocus;
     prjadd.SelectAll;
     exit;
   end;
   Result:=true;
end;

var Ctemp1,ctemp2,Csql:string;
    Executors:TStringList;
begin
  Result:=false;
  if not CheckInput then
    exit;
  if InputMode=SubNewMode then
  begin
    try
      csql:='select * from projectinfo';
      ctemp1:=dm_epm.GetnewitemNo('P002');
      prjtype.Text:='002';
      corpcode.Text := CurCorpCode;
      Parentcode.Text := parentprj;
      if trim(path.Text)<>'' then  path.Text := path.Text+'\'+Parentprj
      else path.Text := Parentprj;
      inputalldata(csql,ctemp1,'Prjcode',self);
      Executors:=TstringList.Create;
      Executors.Add(LoginUser);
      if permission= 5 then
       settasknode(ctemp1,'040201','',Executors)
      else if permission=3 then
        settasknode(ctemp1,'040202','',Executors);
      Executors.Free;
    except
      showmessage('不能保存数据');
      exit;
    end;
   // dm_epm.generatworkplan(ctemp1,'04',gettime);
    if permission= 5 then
    dm_epm.setflowlog(ctemp1,'','新建工程子项目',
                            '040201',loginuser,nil)
    else if permission=3 then
      dm_epm.setflowlog(ctemp1,'','新建工程子项目',
                            '040202',loginuser,nil);
    showmessage('数据保存成功');
    frm_new.ModalResult:=mrok;
    frm_main.Arefresh.Execute;
  end;
  if InputMode=NewMode then
  begin
    Executors:=TstringList.Create;
    try
      csql:='select * from projectinfo';
      ctemp1:=dm_epm.GetnewitemNo('P002');
      prjtype.Text :=  FrefcodeList.Strings[cbb_prjtype.ItemIndex];
      corpcode.Text := CurCorpCode;
      inputalldata(csql,ctemp1,'prjcode',self);
      Executors.Add(Loginuser);
      settasknode(ctemp1,'040100','',Executors);
      dm_epm.generatworkplan(ctemp1,'04',gettime);
      dm_epm.setflowlog(ctemp1,'','受理新建项目',
                            '040100',loginuser,nil);
    except
      Executors.Free;
      showmessage('不能保存数据');
      exit;
    end;
    frm_new.modalresult:=mrok;
    showmessage('数据保存成功');
    frm_new.ModalResult:=mrok;
    frm_main.Arefresh.Execute;
  end else
  if inputmode=EditMode then
  begin
    csql:='select * from projectinfo';
    //PRJTYPE.Text:='002';
    inputalldata(csql,projectcode,'prjcode',self);
    //PRJTYPE.Text:='业扩';
    showmessage('数据保存成功');
  end;
  result:=true;
end;

procedure TFram_NewPrj.btn_genprjaccClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_GenPrjacc,frm_GenPrjacc);
  frm_GenPrjacc.Init(Yktype);
  if Yktype=6 then  frm_GenPrjacc.fram_subprjacc1.lbl_prifix.Caption:= prjacc;
  try
   if  frm_GenPrjacc.ShowModal=mrok then
    PRJACCOUNT.Text := frm_GenPrjacc.PrjAcount;
  finally
    frm_GenPrjacc.Free;
  end;
end;


function TFram_NewPrj.GeneratePrj(PrjAcc: string): Boolean;
var cTemp,cSql:string;
    Executors:TStringlist;
begin
  Result := false;
  ctemp := Dm_epm.GetnewitemNo('P002');
  Executors:= Tstringlist.Create;
  try
    cSql := 'Insert into Projectinfo(prjcode,PrjName,Prjtype,PrjAdd,Designcompany,PrjAccount,lxr,lxdh,zjrl,corpcode)'
             +' Values('''+Ctemp+''','''+Trim(PRJNAME.Text)+''',''002'','
             +''''+Trim(PrjAdd.Text)+''','''+Trim(DesignCompany.Text)+''','''+PrjAcc+''','
             +''''+lxr.Text+''','''+lxdh.Text+''','''+ZJRL.Text+''','''+CurCorpCode+''')';
    QryWork(Dm_Epm.Adoqry_pub,Csql,false);
    Dm_epm.GeneratWorkplan(ctemp,'04',GetTime);
    Executors.Add(Loginuser);
    SetTaskNode(ctemp,'040100','',Executors);
    Dm_epm.SetFlowLog(cTemp,'','受理新建业扩项目',
                            '040100',LoginUser,nil);    //
  except
    ShowMessage('不能保存数据');
    Exit;
  end;
  Executors.Free;     //
  //prjcode := ctemp; //
  Result := true;     //
end;
end.
