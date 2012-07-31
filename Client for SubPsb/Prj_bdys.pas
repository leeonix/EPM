{****************************************************************************
        Engineering Project Management Infomation System
                 For Minhang Power Supply Bureau
                 Author: Tuzz    2001/11
    Copyright (c) 2001-? Shanghai Dawning Software Corporation
****************************************************************************}
unit Prj_bdys;
{***************************************************************************
模块:  变电工程的竣工验收单录入和打印
描述:  竣工验收单录入和打印。
版本:
日期: 2001-12-12
作者: tuzz
更新:
todo: 待业务调整后确定合理的验收单模式
******************************************************************************}

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls,dm,pubvar, DB, ADODB;// frxClass, frxDBSet,
 // frxChBox;

type
  TFram_bdys = class(TFrame)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    Bevel5: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ysqk: TMemo;
    StaticText6: TStaticText;
    ysbm: TComboBox;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    StaticText7: TStaticText;
    sgdw: TComboBox;
    StaticText5: TStaticText;
    sbzj: TMemo;
    kgrq: TEdit;
    ysrq: TEdit;
    jgrq: TEdit;
    StaticText1: TStaticText;
    ys: TComboBox;
    Bevel1: TBevel;
    Label4: TLabel;
    pj_yl: TCheckBox;
    pj_hg: TCheckBox;
    Pj_bhg: TCheckBox;
    Bevel2: TBevel;
    bz: TComboBox;
    StaticText2: TStaticText;
    jh: TComboBox;
    StaticText3: TStaticText;
    Bevel3: TBevel;
    Bevel4: TBevel;
    ADOQuery1: TADOQuery;
    //frxDBDataset1: TfrxDBDataset;
   // frxReport1: TfrxReport;
    procedure sgdwEnter(Sender: TObject);
    procedure kgrqDblClick(Sender: TObject);
  private
    { Private declarations }
  public
     projectid:string;
     InputMode:Integer;
     procedure Init(const Prjcode:string);
     function SaveInfo():Boolean;
     procedure  PrintBod;
    { Public declarations }
  end;

implementation




{$R *.dfm}

procedure TFram_bdys.sgdwEnter(Sender: TObject);
var cTemp:String;
begin
   cTemp:=(sender as Tcombobox).Text;
   DM_epm.InitParam(Tcombobox(sender),Tcombobox(sender).name,'');
   Tcombobox(sender).Text:=cTemp;
end;

procedure TFram_bdys.kgrqDblClick(Sender: TObject);
begin
   (sender as Tedit).Text:=getclendar;
end;

procedure TFram_bdys.Init(const Prjcode: string);
var cSql:string;
begin
  Projectid:=PrjCode;
  csql:='select * from prj_bdjgys where prjcode='''+Prjcode+'''';

  Loaddata(dm_epm.adoqry_pub,csql,self);
  if Userdepart='变电工区' then
    Inputmode:=EditMode
  else    InputMode:=BroswerMode;
end;

function TFram_bdys.SaveInfo: Boolean;
var cSql:string;
begin
   Result:=false;
  if Trim(sgdw.Text)<>'' then
     dm_epm.InsertParam('sgdw',sgdw.Text);
  if Trim(ysbm.Text)<>'' then
     Dm_epm.InsertParam('ysbm',ysbm.Text);
  if Trim(ys.Text)<>'' then
     Dm_epm.InsertParam('ys',ys.Text);
  if Trim(bz.Text)<>'' then
     Dm_epm.InsertParam('bz',bz.Text);
  if Trim(jh.Text)<>'' then
   Dm_epm.InsertParam('jh',jh.Text);
  cSql:='select * from prj_bdjgys ';

  if InputMode=EditMode then
    InputAllData(cSql,ProjectId,'prjcode',self);
  Showmessage('数据保存成功');
  Result:= true;
end;

procedure TFram_bdys.PrintBod;
begin
   ADOQuery1.Active := false;
   ADOQuery1.Parameters.ParamByName('mycode').Value := projectid;
   ADOQuery1.Active := true;
  // frxReport1.LoadFromFile('.\reports\变电验收单.fr3');
  // frxReport1.ShowReport(true);

end;

end.
