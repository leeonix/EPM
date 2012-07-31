unit JsReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, dm,
  Dialogs, ExtCtrls, StdCtrls, Mask, RzEdit, DB, ADODB, MyReport, Buttons, DateUtils,
  RzPanel, RzRadGrp, Grids, DBGrids, RzDBGrid, RzButton, RzTabs;

type
  Tfrm_jsreport = class(TForm)
    ADOQuery1: TADOQuery;
    ADOQuery1PRJACCOUNT: TStringField;
    ADOQuery1PRJNAME: TStringField;
    ADOQuery1Htje: TStringField;
    ADOQuery1Sgdw: TStringField;
    ADOQuery1SsPrice: TIntegerField;
    ADOQuery1SjPrice: TIntegerField;
    ADOQuery1Jsrq: TDateTimeField;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    RzPanel2: TRzPanel;
    Label10: TLabel;
    Bevel1: TBevel;
    Label11: TLabel;
    startdate: TRzDateTimeEdit;
    enddate: TRzDateTimeEdit;
    RzDBGrid1: TRzDBGrid;
    RzPanel1: TRzPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RzButton1: TRzButton;
    TabSheet3: TRzTabSheet;
    TabSheet4: TRzTabSheet;
    DataSource1: TDataSource;
    ADOQuery1TypeName: TStringField;
    ADOQuery1Sjcompany: TStringField;
    RzPanel3: TRzPanel;
    Label1: TLabel;
    Bevel2: TBevel;
    Label2: TLabel;
    RzDateTimeEdit1: TRzDateTimeEdit;
    RzDateTimeEdit2: TRzDateTimeEdit;
    RzDBGrid2: TRzDBGrid;
    RzPanel4: TRzPanel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    RzButton2: TRzButton;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    ADOQuery2PRJACCOUNT: TStringField;
    ADOQuery2PRJNAME: TStringField;
    ADOQuery2constructby: TStringField;
    ADOQuery2DYDJ: TStringField;
    ADOQuery2TYPENAME: TStringField;
    ADOQuery2htyf: TStringField;
    ADOQuery2httype: TStringField;
    ADOQuery2Htje: TStringField;
    ADOQuery2jsje: TIntegerField;
    MyReport1: TMyReport;
    RzPanel5: TRzPanel;
    Label3: TLabel;
    Bevel3: TBevel;
    Label4: TLabel;
    startdate2: TRzDateTimeEdit;
    enddate2: TRzDateTimeEdit;
    RzPanel6: TRzPanel;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    RzButton3: TRzButton;
    RzDBGrid3: TRzDBGrid;
    ds_jq: TDataSource;
    qry_Jq: TADOQuery;
    qry_JqTYPENAME: TStringField;
    qry_Jqerpcode: TStringField;
    qry_JqPrjname: TStringField;
    qry_Jqsumfee: TIntegerField;
    qry_Jqsjprice: TIntegerField;
    qry_Jqjsrq: TDateTimeField;
    qry_Jqjyfee: TIntegerField;
    procedure RzButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RzPageControl1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RzButton2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure RzButton3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_jsreport: Tfrm_jsreport;

implementation

{$R *.dfm}

procedure Tfrm_jsreport.BitBtn1Click(Sender: TObject);
  var csql,exceltype,title :string;
      resstrings:TStringList;
      year,month,day: Word;
begin
  Screen.Cursor := crHourGlass;
  MyReport1.templatefilename:='JsmonthReport';
  MyReport1.dataset:= ADOQuery1;
  resstrings := TStringList.Create;
  DecodeDate(Today,year,month,day);
  title := IntToStr(year) +'年'+ IntToStr(month)+'月结算情况表（月报）';

  resstrings.Add(title);
  resstrings.Add(DateToStr(Today));
  MyReport1.execute('jsmonth',resstrings);
  resstrings.Free;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_jsreport.BitBtn3Click(Sender: TObject);
 var csql,exceltype,title :string;
      resstrings:TStringList;
      year,month,day: Word;
begin
  Screen.Cursor := crHourGlass;
  MyReport1.templatefilename:='Htreport';
  MyReport1.dataset := ADOQuery2;
  resstrings := TStringList.Create;
  DecodeDate(Today,year,month,day);
  title :='市南供电公司'+ IntToStr(year) +'年(1-6)月工程承发包合同情况表（季报）';
  resstrings.Add(title);
  resstrings.Add(DateToStr(Today));
  MyReport1.execute('htreport',resstrings);
  resstrings.Free;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_jsreport.BitBtn5Click(Sender: TObject);
var csql,exceltype,title :string;
      resstrings:TStringList;
      year,month,day: Word;
begin
  Screen.Cursor := crHourGlass;
  MyReport1.templatefilename:='jymonth';
  MyReport1.dataset := qry_Jq;
  resstrings := TStringList.Create;
  DecodeDate(Today,year,month,day);
  title :='市南供电公司'+ IntToStr(year) +'年'+ IntToStr(month)+'月工程结清情况统计报表';
  resstrings.Add(title);
  resstrings.Add(DateToStr(Today));
  MyReport1.execute('jymonth',resstrings);
  resstrings.Free;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_jsreport.FormCreate(Sender: TObject);
begin
   startdate.Date :=  EncodeDate(YearOf(Today),   MonthOf(Today), 1);
   enddate.Date := EndOfTheMonth(Today) ;
end;

procedure Tfrm_jsreport.RzButton1Click(Sender: TObject);
var csql :string;
begin
  csql:='exec GetJsMonthReport '''+datetostr(startdate.date)+''','
              + ''''+datetostr(enddate.date)+'''';

  QryWork(ADOQuery1,csql,True);



end;

procedure Tfrm_jsreport.RzButton2Click(Sender: TObject);
var csql :string;
begin
  csql:='exec GetHTReport '''+datetostr(RzDateTimeEdit1.date)+''','
              + ''''+datetostr(RzDateTimeEdit2.date)+'''';

  QryWork(ADOQuery2,csql,True);
end;

// 总账号结算情况汇总
procedure Tfrm_jsreport.RzButton3Click(Sender: TObject);
var csql :string;
begin
   csql:='exec GetJSByErpcode '''+datetostr(startdate2.date)+''','
              + ''''+datetostr(enddate2.date)+'''';

  QryWork(qry_Jq,csql,True);
end;

procedure Tfrm_jsreport.RzPageControl1Change(Sender: TObject);
begin
  if RzPageControl1.ActivePageIndex=0 then
  begin
    startdate.Date :=  EncodeDate(YearOf(Today),   MonthOf(Today), 1);
    enddate.Date := EndOfTheMonth(Today) ;
  end;
  if RzPageControl1.ActivePageIndex=2 then
  begin
    RzDateTimeEdit1.Date :=  EncodeDate(YearOf(Today),   1, 1);
    RzDateTimeEdit2.Date :=EncodeDate(YearOf(Today),   6, 30);
  end;
  if RzPageControl1.ActivePageIndex=1 then
  begin
    startdate2.Date :=  EncodeDate(YearOf(Today),   MonthOf(Today), 1);
    enddate2.Date := EndOfTheMonth(Today) ;
  end;
end;

end.
