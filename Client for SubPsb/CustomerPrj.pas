unit CustomerPrj;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,  ExtCtrls,dm,pubvar;

type
  TFram_CustmerPrj = class(TFrame)
    Panel1: TPanel;
    Label7: TLabel;
    Bevel1: TBevel;
    Panel2: TPanel;
    StaticText1: TStaticText;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    CUSTOMERNAME: TEdit;
    PAYFEEDATE: TEdit;
    STARTDATE: TEdit;
    PRJACCOUNT: TEdit;
    JHStart: TEdit;
    FINISHDATE: TEdit;
    jhtujdate: TEdit;
    Bevel2: TBevel;
    Label10: TLabel;
    Label11: TLabel;
    Jhfinish: TEdit;
    Bevel3: TBevel;
    Label12: TLabel;
    tujdate: TEdit;
    Label13: TLabel;
    jhcheck: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    CHECKDATE: TEdit;
    Bevel4: TBevel;
    Label16: TLabel;
    Fyyfq: TCheckBox;
    SUPERVISION: TComboBox;
    procedure JHStartDblClick(Sender: TObject);
    procedure SUPERVISIONEnter(Sender: TObject);
  private
    FstrSql:string;
    { Private declarations }
  public
    Projectid:string;
    Procedure Init(const prjcode:string);
    Procedure Saveinfo;
    { Public declarations }
  end;

implementation

uses Prj_Design;

   const Scb='实业分公司市场部';
         Gcb='实业分公司工程部';
         Ydjc='用电监察';


{$R *.dfm}

{ TFram_CustmerPrj }

procedure TFram_CustmerPrj.Init(const prjcode: string);
var cSql:string;
begin
  Projectid:=PrjCode;
  FstrSql:='select * from PRJCUSTOMERINTER ';
  cSql := FstrSql+'Where Prjcode='''+Projectid+'''' ;
  Loaddata(dm_epm.adoqry_pub,cSql,self);
  PRJACCOUNT.Enabled := RolName= Scb;
  JHStart.Enabled := RolName = Scb;
  jhtujdate.Enabled := RolName= Ydjc;
  PAYFEEDATE.Enabled := PRJACCOUNT.Enabled;
  Fyyfq.Enabled:= PRJACCOUNT.Enabled;
  Jhfinish.Enabled := JHStart.Enabled;
  STARTDATE.Enabled := RolName = Gcb;
  FINISHDATE.Enabled := RolName = Gcb;
  tujdate.Enabled :=  jhtujdate.Enabled;
  CHECKDATE.Enabled :=jhtujdate.Enabled;
  jhcheck.Enabled := jhtujdate.Enabled;
  SUPERVISION.Enabled := jhtujdate.Enabled;
  Frm_PrjDesign.A_save.Enabled:= true;
 // Frm_PrjDesign.ToolButton6.Enabled := True;
end;

procedure TFram_CustmerPrj.JHStartDblClick(Sender: TObject);
begin
 (sender as Tedit).Text:=getclendar;
end;

procedure TFram_CustmerPrj.Saveinfo;

begin
  InputAllData(FstrSql,Projectid,'prjcode',self);
end;

procedure TFram_CustmerPrj.SUPERVISIONEnter(Sender: TObject);
var csql:string;
begin
    csql := 'select EMPLOYEENAME from dbo.EMPLOYEE a inner join dbo.COMPOSE b on a.jobcode=b.jobcode'
      +' inner join jobrole c on c.rolid=b.rolid'
      +' where c.rolename=''用电监察'' and corpcode='''+CurCorpCode+'''';
    QryWork(Dm_Epm.adoqry_pub,csql);
    SUPERVISION.Items.Clear;
    while not   Dm_Epm.adoqry_pub.Eof do
    begin
       SUPERVISION.Items.Add( Dm_Epm.adoqry_pub.fieldbyname('EMPLOYEENAME').AsString);
       Dm_Epm.adoqry_pub.Next;
    end;
end;

end.
