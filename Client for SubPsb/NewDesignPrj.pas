unit NewDesignPrj;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls,pubvar,dm;

type
  Tfram_designprj = class(TFrame)
    Label3: TLabel;
    PRJTYPE: TComboBox;
    corpcode: TEdit;
    parentcode: TEdit;
    PLAN_YEAR: TEdit;
    Label22: TLabel;
    Label4: TLabel;
    PRJNAME: TEdit;
    PRJACCOUNT: TEdit;
    Label2: TLabel;
    Label6: TLabel;
    DESIGNCOMPANY: TComboBox;
    Bevel3: TBevel;
    Label14: TLabel;
    procedure DESIGNCOMPANYEnter(Sender: TObject);
 private
    { Private declarations }
    Prjacc     : string;    //工程帐号
    ProjectCode: string;    //工程代码
  public
    InputMode  : integer; //输入模式
    ParentPrj :string;
    procedure Init(const Prjcode,executor,Node:string);
    function SaveInfo:Boolean;
    function Createsubprj:Boolean;
  end;

implementation

uses newitem, MAIN;

{$R *.dfm}

{ Tfram_designprj }

function Tfram_designprj.Createsubprj: Boolean;
var Csql:string;
begin
  csql:='select * from projectinfo  where  prjcode='''+Parentprj+'''';
  Loaddata(dm_epm.adoqry_pub,csql,self);
  if PRJTYPE.Text='003' then
     PRJTYPE.Text:='两网'
  else if PRJTYPE.Text='004' then
     PRJTYPE.Text:='基建'
  else if PRJTYPE.Text='005' then
     PRJTYPE.Text:='大修'
  else if PRJTYPE.Text='006' then
     PRJTYPE.Text:='技改' ;
  Prjaccount.Text:=trim(prjaccount.Text)+'-';
  Parentcode.Text:=parentprj;
end;

procedure Tfram_designprj.Init(const Prjcode, executor, Node: string);
var csql:string;
begin
  ProjectCode:=Prjcode;
  csql:='select * from projectinfo  where  prjcode='''+Prjcode+'''';
  Loaddata(dm_epm.adoqry_pub,csql,self);
  if (Permission=4) or(Permission=5)  then
    InputMode := EditMode
  else InputMode:=BroswerMode;
  if PRJTYPE.Text='004' then
     PRJTYPE.Text:='基建'
  else if PRJTYPE.Text='005' then
     PRJTYPE.Text:='大修'  //
  else if PRJTYPE.Text='006' then
     PRJTYPE.Text:='技改'
  else if prjtype.Text='008' then
     prjtype.Text:='用改'
   else if prjtype.Text='009' then
     prjtype.Text:='用户内部';
  Prjacc:=trim(prjaccount.Text);
end;

function Tfram_designprj.SaveInfo: Boolean;
function CheckInput():Boolean;
var csql:string;
begin
  Result:=false;
  if trim(prjtype.Text)='' then
  begin
     ShowMessage('请输入工程性质');
     PrjType.SetFocus;
     PrjType.SelectAll;
     Exit;
  end else
  if trim(PrjName.Text)='' then
  Begin
    Showmessage('请输入工程名称');
    Prjname.SetFocus;
    Prjname.SelectAll;
    Exit;
  end else
  if trim(Prjaccount.Text)='' then
  begin
    ShowMessage('请输入工程帐号');
    PrjAccount.SetFocus;
    PrjAccount.SelectAll;
    exit;
  end;
  if Prjacc<>trim(Prjaccount.Text) then
  begin
    csql:='select *  from projectinfo where PrjAccount='''+Trim(PrjAccount.text)+'''';
    QryWork(Dm_epm.adoqry_pub,csql);
    if not  Dm_epm.adoqry_pub.IsEmpty then
    begin
      showmessage('工程帐号不可以重复，请检查工程帐号');
      prjaccount.SetFocus;
      exit;
    end;
  end;
  Result:=true;
end;

var ctemp,cprjtype,csql:string;
    Executors:TstringList;
begin
  Result:= false;
  if not checkInput then
     exit;
  csql:='select * from Projectinfo';
  if inputmode=SubNewMode then
  begin
    try
      ctemp:=dm_epm.GetnewitemNo('P009');
      if Prjtype.Text='两网' then
       Prjtype.Text:='003'
      else if Prjtype.Text='基建' then
        Prjtype.Text:='004'
      else if Prjtype.Text='大修' then
       prjtype.Text:='005'
      else if Prjtype.Text='技改' then
       prjtype.Text:='006'
      else if Prjtype.Text='用改'  then
        Prjtype.Text:='008'
      else if Prjtype.Text='用户内部'  then
        Prjtype.Text:='009';
      Parentcode.Text:=parentprj;
      corpcode.Text := CurCorpCode;
      inputalldata(csql,ctemp,'Prjcode',self);
     // prjtype.Text:='006';
      Executors:=TstringList.Create;
      Executors.Add(LoginUser);
      settasknode(ctemp,'020201','',Executors);
      Executors.Free;
    except
      showmessage('不能保存数据');
      exit;
    end;
    //dm_epm.generatworkplan(ctemp,'02',gettime);
    dm_epm.setflowlog(ctemp,'','新建子项目',
                            '020201',loginuser,nil);
    showmessage('数据保存成功');
    frm_new.ModalResult:=mrok;
    frm_main.Arefresh.Execute;
  end else
  if inputmode=NewMode then
  begin
    try
      ctemp:=dm_epm.GetnewitemNo('P009');
      case PRJTYPE.ItemIndex of
      0: prjtype.Text:='003';
      1: prjtype.Text:='004';
      2: prjtype.Text:='005';
      3: prjtype.Text:='006';
      4: prjtype.Text:='008';
      5: prjtype.Text := '009';
      end;
      corpcode.Text := CurCorpCode;
      inputalldata(csql,ctemp,'Prjcode',self);
      //prjtype.Text:='006';
      Executors:=TstringList.Create;
      Executors.Add(LoginUser);
      settasknode(ctemp,'020100','',Executors);
      Executors.Free;
    except
      showmessage('不能保存数据');
      exit;
    end;

    dm_epm.setflowlog(ctemp,'','根据设计委托书新建项目',
                            '020100',loginuser,nil);
    showmessage('数据保存成功');
    frm_new.ModalResult:=mrok;
    frm_main.Arefresh.Execute;
  end else
  if inputmode=EditMode then
  begin
      cprjtype:=prjtype.Text;
     if Prjtype.Text='两网' then
      Prjtype.Text:='003'
     else if Prjtype.Text='基建' then
       Prjtype.Text:='004'
     else if Prjtype.Text='大修' then
      prjtype.Text:='005'
     else if Prjtype.Text='技改' then
      prjtype.Text:='006'
     else if Prjtype.Text='用改'  then
       Prjtype.Text:='008'
     else if Prjtype.Text='用户内部'  then
        Prjtype.Text:='009';
     InputAllData(csql,ProjectCode,'prjcode',self);
     Prjtype.Text:= cprjtype;
     ShowMessage('数据保存成功');
  end;
  Result:=true;
end;

procedure Tfram_designprj.DESIGNCOMPANYEnter(Sender: TObject);
begin
 Dm_epm.InitCombobox(Tcombobox(sender));
end;

end.
