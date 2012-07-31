unit Baseinfo_xt;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,dm,pubvar, ExtCtrls, ComCtrls;

type
  TFram_NewNbPrj = class(TFrame)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Bevel3: TBevel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    PRJTYPE: TComboBox;
    PRJNAME: TEdit;
    PRJACCOUNT: TEdit;
    OTHERTYPE: TComboBox;
    DESIGNCOMPANY: TComboBox;
    PFWJWH: TEdit;
    KYSBBM: TComboBox;
    KYPFRQ: TEdit;
    kysbrq: TEdit;
    zjpfwh: TEdit;
    YSSBRQ: TEdit;
    ZJPFRQ: TEdit;
    PFZE: TEdit;
    gstz: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    pfazf: TEdit;
    pfqtf: TEdit;
    pfsbf: TEdit;
    Label20: TLabel;
    primmaterial: TRichEdit;
    Bevel4: TBevel;
    PLAN_YEAR: TEdit;
    Label22: TLabel;
    parentcode: TEdit;
    corpcode: TEdit;
    path: TEdit;
    procedure KYPFRQDblClick(Sender: TObject);
    procedure OTHERTYPEEnter(Sender: TObject);

  private
    { Private declarations }
    Prjacc     : string;    //�����ʺ�
    ProjectCode: string;    //���̴���
  public
    InputMode  : integer; //����ģʽ
    ParentPrj :string;
    procedure Init(const Prjcode,executor,Node:string);
    function SaveInfo:Boolean;
    function Createsubprj:Boolean;
    { Public declarations }
  end;

implementation

uses  MAIN, Newitem;

{$R *.dfm}

function TFram_NewNbPrj.Createsubprj: Boolean;
var Csql:string;
begin
  csql:='select * from projectinfo  where  prjcode='''+Parentprj+'''';
  Loaddata(dm_epm.adoqry_pub,csql,self);
  if PRJTYPE.Text='003' then
     PRJTYPE.Text:='����'
  else if PRJTYPE.Text='004' then
     PRJTYPE.Text:='����'
  else if PRJTYPE.Text='005' then
     PRJTYPE.Text:='����'
  else if PRJTYPE.Text='006' then
     PRJTYPE.Text:='����' ;
  Prjaccount.Text:=trim(prjaccount.Text)+'-';
  Parentcode.Text:=parentprj;


end;

procedure TFram_NewNbPrj.Init(const Prjcode, executor, Node: string);
var csql:string;
begin
  ProjectCode:=Prjcode;
  cSql:='select * from projectinfo  where  prjcode='''+Prjcode+'''';
  Loaddata(dm_epm.adoqry_pub,csql,self);
  if (Permission=4) or(Permission=5)  then
    InputMode := EditMode
  else InputMode:=BroswerMode;
  if PRJTYPE.Text='003' then PRJTYPE.Text:='����'
  else if PRJTYPE.Text='004' then  PRJTYPE.Text:='����'
  else if PRJTYPE.Text='005' then  PRJTYPE.Text:='����'
  else if PRJTYPE.Text='006' then  PRJTYPE.Text:='����'
  else if prjtype.Text='008' then  Prjtype.Text:='�ø�'
  else if prjtype.Text='009' then  Prjtype.Text:='�û��ڲ�';
  Prjacc:=trim(prjaccount.Text);
end;

procedure TFram_NewNbPrj.KYPFRQDblClick(Sender: TObject);
begin
  (sender as Tedit).Text:=getclendar;
end;



procedure TFram_NewNbPrj.OTHERTYPEEnter(Sender: TObject);
begin
   Dm_epm.InitCombobox(Tcombobox(sender));
end;

function TFram_NewNbPrj.SaveInfo:Boolean;
function CheckInput():Boolean;
var csql:string;
begin
  Result:=false;
  if trim(prjtype.Text)='' then
  begin
     ShowMessage('�����빤������');
     PrjType.SetFocus;
     PrjType.SelectAll;
     Exit;
  end else
  if trim(PrjName.Text)='' then
  Begin
    Showmessage('�����빤������');
    Prjname.SetFocus;
    Prjname.SelectAll;
    Exit;
  end else
  if trim(Prjaccount.Text)='' then
  begin
    ShowMessage('�����빤���ʺ�');
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
      showmessage('�����ʺŲ������ظ������鹤���ʺ�');
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
      ctemp:=dm_epm.GetnewitemNo('P003');
      if Prjtype.Text='����' then
       Prjtype.Text:='003'
      else if Prjtype.Text='����' then
        Prjtype.Text:='004'
      else if Prjtype.Text='����' then
       prjtype.Text:='005'
      else if Prjtype.Text='����' then
       prjtype.Text:='006'
      else if Prjtype.Text='�ø�'  then
        Prjtype.Text:='008'
      else if Prjtype.Text='�û��ڲ�'  then
        Prjtype.Text:='009';
      Parentcode.Text:=parentprj;
      corpcode.Text := CurCorpCode;
       if trim(path.Text)<>'' then  path.Text := path.Text+'\'+Parentprj
        else path.Text := Parentprj;
      inputalldata(csql,ctemp,'Prjcode',self);
      prjtype.Text:='006';
      Executors:=TstringList.Create;
      Executors.Add(LoginUser);
      settasknode(ctemp,'010201','',Executors);
      Executors.Free;
    except
      showmessage('���ܱ�������');
      exit;
    end;
    //dm_epm.generatworkplan(ctemp,'01',gettime);
    dm_epm.setflowlog(ctemp,'','�½�����Ŀ',
                            '010201',loginuser,nil);
    showmessage('���ݱ���ɹ�');
    frm_new.ModalResult:=mrok;
    frm_main.Arefresh.Execute;
  end else
  if inputmode=NewMode then
  begin
    try
      ctemp:=dm_epm.GetnewitemNo('P003');
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
     // prjtype.Text:='006';
      Executors:=TstringList.Create;
      Executors.Add(LoginUser);
      settasknode(ctemp,'010100','',Executors);
      Executors.Free;
    except
      showmessage('���ܱ�������');
      exit;
    end;
   // dm_epm.generatworkplan(ctemp,'05',gettime);
    dm_epm.setflowlog(ctemp,'','�½���Ŀ',
                            '010100',loginuser,nil);
    showmessage('���ݱ���ɹ�');
    frm_new.ModalResult:=mrok;
    frm_main.Arefresh.Execute;
  end else
  if inputmode=EditMode then
  begin
      cprjtype:=prjtype.Text;
     if Prjtype.Text='����' then
      Prjtype.Text:='003'
     else if Prjtype.Text='����' then
       Prjtype.Text:='004'
     else if Prjtype.Text='����' then
      prjtype.Text:='005'
     else if Prjtype.Text='����' then
      prjtype.Text:='006'
     else if Prjtype.Text='�ø�'  then
       Prjtype.Text:='008'
     else if PRJTYPE.Text = '�û��ڲ�' then
       PRJTYPE.Text := '009';
     InputAllData(csql,ProjectCode,'prjcode',self);
     Prjtype.Text:= cprjtype;
     ShowMessage('���ݱ���ɹ�');
  end;
  Result:=true;
end;

end.
