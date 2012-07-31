unit Prj_jgys;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls,dm,pubvar,  DB, ADODB; //frxClass, frxDBSet;

type
  TFrame_Jgys = class(TFrame)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Bevel5: TBevel;
    Label1: TLabel;
    Bevel2: TBevel;
    gznr: TMemo;
    StaticText11: TStaticText;
    StaticText6: TStaticText;
    ysbz: TComboBox;
    StaticText8: TStaticText;
    StaticText10: TStaticText;
    sgy: TComboBox;
    StaticText9: TStaticText;
    StaticText7: TStaticText;
    sgbz: TComboBox;
    StaticText5: TStaticText;
    StaticText15: TStaticText;
    gcysy_sgfz: TEdit;
    sgfzr: TEdit;
    StaticText16: TStaticText;
    StaticText13: TStaticText;
    bzzysyj: TEdit;
    gcysy_wb: TEdit;
    wbdbr: TEdit;
    StaticText14: TStaticText;
    StaticText17: TStaticText;
    yxysyj: TMemo;
    StaticText4: TStaticText;
    sgrq: TEdit;
    yqysrq: TEdit;
    bgrq: TEdit;
    wbdbqzrq: TEdit;
    sgfzrqzrq: TEdit;
    ddhb: TEdit;
    StaticText31: TStaticText;
    StaticText33: TStaticText;
    StaticText34: TStaticText;
    StaticText35: TStaticText;
    xzcd_35: TEdit;
    xzcd_38: TEdit;
    xzcd_10: TEdit;
    dhcd_10: TEdit;
    dhcd_38: TEdit;
    dhcd_35: TEdit;
    bz: TMemo;
    StaticText1: TStaticText;
    StaticText37: TStaticText;
    Bevel1: TBevel;
    StaticText36: TStaticText;
    dtdj: TCheckBox;
    StaticText25: TStaticText;
    StaticText27: TStaticText;
    gygh: TEdit;
    dygh: TEdit;
    StaticText28: TStaticText;
    StaticText26: TStaticText;
    StaticText29: TStaticText;
    StaticText30: TStaticText;
    dyczr: TEdit;
    gyczr: TEdit;
    dcdj: TCheckBox;
    Bevel4: TBevel;
    Bevel3: TBevel;
    jsbcc: TCheckBox;
    StaticText21: TStaticText;
    gcjgrq: TEdit;
    StaticText22: TStaticText;
    bmjgqrr: TEdit;
    qrrq: TEdit;
    StaticText3: TStaticText;
    StaticText2: TStaticText;
    JSBYSRQ: TEdit;
    jsbys: TEdit;
    StaticText19: TStaticText;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Bevel8: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    StaticText18: TStaticText;
    StaticText12: TStaticText;
    Bevel9: TBevel;
    Bevel10: TBevel;
    Label4: TLabel;
    zylb: TEdit;
    ADOQuery1: TADOQuery;
    procedure sgbzEnter(Sender: TObject);
    procedure sgrqDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    Projectid,Projectname:string;
    Inputmode:Integer;
    procedure Init(const Prjcode,ProfessionType:string);
    procedure InitCombox(TagetComBobox:TComBobox);
    Function SaveInfo():Boolean;
    procedure PrintBod;
    { Public declarations }
  end;

implementation



{$R *.dfm}

procedure TFrame_Jgys.Init(const Prjcode,ProfessionType: string);
var cSql:string;
begin
  zylb.Text := ProfessionType;
  Projectid:=PrjCode;
  if ProfessionType='线路' then
    csql:='select * from prj_jgys where prjcode='''+Prjcode+''' and  zylb=''线路''';

  Loaddata(dm_epm.adoqry_pub,csql,self);
  if ((Userdepart='线路工区') or (Userdepart='变电工区')) or (Userdepart='设备运行部') then
    Inputmode:=EditMode
  else
  begin
    InputMode:=BroswerMode;
  end;
end;

procedure TFrame_Jgys.InitCombox(TagetComBobox: TComBobox);
var cTemp:string;
begin
  cTemp:= TagetComBobox.Text;
  DM_epm.InitParam(TagetComBobox,TagetComBobox.Name,'');
  TagetComBobox.DroppedDown  := True;
  TagetComBobox.Text:=cTemp;
end;

procedure TFrame_Jgys.sgbzEnter(Sender: TObject);
var ctemp:string;
begin
   cTemp:=(sender as Tcombobox).Text;
   DM_epm.InitParam(Tcombobox(sender),Tcombobox(sender).name,'');
   Tcombobox(sender).Text:=cTemp;
end;

procedure TFrame_Jgys.sgrqDblClick(Sender: TObject);
begin
  (sender as Tedit).Text:=getclendar;
end;

function TFrame_Jgys.SaveInfo():Boolean;
var cSql:string;
begin
  Result:=false;
  if Trim(sgbz.Text)<>'' then
     dm_epm.InsertParam('sgbz',sgbz.Text);
  if Trim(ysbz.Text)<>'' then
     Dm_epm.InsertParam('ysbz',ysbz.Text);
  if Trim(sgy.Text)<>'' then
     Dm_epm.InsertParam('sgy',sgy.Text);
  cSql:='select * from prj_jgys ';
  if InputMode=EditMode then
  begin
    InputAllData(cSql,ProjectId,'prjcode',self);
  end;
  Showmessage('数据保存成功');
  Result:= true;
end;

procedure TFrame_Jgys.PrintBod;
begin

end;

end.

