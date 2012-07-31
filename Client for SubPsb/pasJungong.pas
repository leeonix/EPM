unit pasJungong;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls,dm,pubvar;

type
  TfrmJunGong = class(TForm)
    Panel1: TPanel;
    StaticText12: TStaticText;
    StaticText15: TStaticText;
    gcysy_sgfz: TEdit;
    sgfzr: TEdit;
    StaticText16: TStaticText;
    sgfzrqzrq: TDateTimePicker;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    StaticText10: TStaticText;
    yqysrq: TDateTimePicker;
    bgrq: TDateTimePicker;
    ddhb: TDateTimePicker;
    StaticText11: TStaticText;
    gznr: TMemo;
    StaticText13: TStaticText;
    bzzysyj: TEdit;
    gcysy_wb: TEdit;
    wbdbr: TEdit;
    StaticText14: TStaticText;
    wbdbqzrq: TDateTimePicker;
    StaticText17: TStaticText;
    yxysyj: TMemo;
    StaticText19: TStaticText;
    jsbys: TEdit;
    jsbysrq: TDateTimePicker;
    StaticText21: TStaticText;
    StaticText22: TStaticText;
    gcjgrq: TDateTimePicker;
    bmjgqrr: TEdit;
    qrrq: TDateTimePicker;
    StaticText25: TStaticText;
    StaticText26: TStaticText;
    StaticText27: TStaticText;
    StaticText28: TStaticText;
    gygh: TEdit;
    dygh: TEdit;
    StaticText29: TStaticText;
    StaticText30: TStaticText;
    gyczr: TEdit;
    dyczr: TEdit;
    StaticText31: TStaticText;
    StaticText33: TStaticText;
    StaticText34: TStaticText;
    StaticText35: TStaticText;
    xzcd_10: TEdit;
    xzcd_38: TEdit;
    xzcd_35: TEdit;
    dhcd_10: TEdit;
    dhcd_38: TEdit;
    dhcd_35: TEdit;
    StaticText36: TStaticText;
    StaticText37: TStaticText;
    bz: TMemo;
    Bevel1: TBevel;
    sgrq: TDateTimePicker;
    sgbz: TComboBox;
    ysbz: TComboBox;
    sgy: TComboBox;
    Label1: TLabel;
    Bevel2: TBevel;
    StaticText1: TStaticText;
    dcdj: TCheckBox;
    dtdj: TCheckBox;
    jsbcc: TCheckBox;
    StaticText2: TStaticText;
    Bevel3: TBevel;
    StaticText3: TStaticText;
    Bevel4: TBevel;
    StaticText4: TStaticText;
    Bevel5: TBevel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    Projectid,Projectname:string;
    Inputmode:Integer;
    procedure Init(const Prjcode,Executor,Node,Prjname:string);
    procedure InitCombox(TagetComBobox:TComBobox);
    { Public declarations }
  end;

var
  frmJunGong: TfrmJunGong;

implementation

{$R *.dfm}

procedure TfrmJunGong.Button1Click(Sender: TObject);
var cSql:string;
begin
  csql:='select * from prj_jgys ';
  if inputmode=EditMode then
  begin
    inputalldata(csql,projectid,'prjcode',self);
  end;
  showmessage('数据保存成功');
end;
procedure TfrmJunGong.Init(const Prjcode, Executor, Node, Prjname: string);
var cSql:string;
begin
  Projectid:=PrjCode;
  ProjectName:=PrjName;
  csql:='select * from prj_jgys where prjcode='''+Prjcode+'''';
  Loaddata(dm_epm.adoqry_pub,csql,self);
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
  lbl_prjname.Caption:=Prjname;
  lbl_prjacc.Caption:=ptaskinfo(frm_main.Lsv_Task.Selected.Data)^.prjacc;
  //panel1.Caption:=panel1.caption+'   工程名称:'+prjname;
end;

procedure TfrmJunGong.InitCombox(TagetComBobox: TComBobox);
begin

end;

end;

end.
