unit ReportManag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dm,pubvar, StdCtrls, ComCtrls, FmxUtils,MyReport,
  RzGroupBar;

type
  TFrm_report = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    RadioGroup1: TRadioGroup;
    pnl_container: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    Label4: TLabel;
    Bevel2: TBevel;
    Label5: TLabel;
    cbx_design: TComboBox;
    RzGroupBar1: TRzGroupBar;
    RzGroup1: TRzGroup;
    RzGroup2: TRzGroup;
    dtp_begin: TDateTimePicker;
    dtp_end: TDateTimePicker;
    excelrep: TMyReport;
    procedure RzGroup2Items0Click(Sender: TObject);
    procedure RzGroup1Items2Click(Sender: TObject);
    procedure RzGroup1Items1Click(Sender: TObject);
    procedure RzGroup1Items0Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

    { Private declarations }
  public

    exceltype:string;

    { Public declarations }
  end;

var
  Frm_report: TFrm_report;

implementation

{$R *.dfm}

procedure TFrm_report.FormCreate(Sender: TObject);
var Csql:string;
begin
 with cbx_design.Items do
  begin
     clear;
     csql:='select employeename from employee where department=''…Ëº∆ “'' and corpcode='''+CurCorpCode+'''';
     qrywork(dm_epm.adoqry_pub,csql);
     if not dm_epm.adoqry_pub.IsEmpty then
     while not dm_epm.adoqry_pub.Eof do
     begin
       add(dm_epm.adoqry_pub.fieldbyname('employeename').AsString);
       dm_epm.adoqry_pub.Next;
     end;
  end;
 // excelrep.templatepath:=extractfilepath(paramstr(0))+'\reports\';
  dtp_begin.Date := Date;
  dtp_end.DateTime := Date+30; 
end;

procedure TFrm_report.RzGroup1Items0Click(Sender: TObject);
var csql :string;
begin
  cSql:='exec DesignPrj '''+datetostr(dtp_begin.date)+''','
              + ''''+datetostr(dtp_end.date)+''','''+CurCorpCode+'''';
  excelrep.templatefilename:='monthreport';
  exceltype:='moth';
  qrywork(dm_epm.adoqry_rep,csql,true);
  excelrep.execute(exceltype,nil);
end;

procedure TFrm_report.RzGroup1Items1Click(Sender: TObject);
var csql :string;
begin
   cSql:='exec DesignPrjByEngineer '''+datetostr(dtp_begin.Date)+''','
               +''''+datetostr(dtp_end.date)+''','''+cbx_design.text+''','''+CurCorpCode+'''';
          excelrep.templatefilename:='perreport';
          exceltype:='per';
   qrywork(dm_epm.adoqry_rep,csql,true);
  excelrep.execute(exceltype,nil);
end;

procedure TFrm_report.RzGroup1Items2Click(Sender: TObject);
var csql :string;
begin
     cSql:='exec DesignPrjBytype '''+datetostr(dtp_begin.date)+''','
        + ''''+datetostr(dtp_end.date)+''','''+CurCorpCode+'''';
     excelrep.templatefilename:='bonusreport';
     exceltype:='';
    qrywork(dm_epm.adoqry_rep,csql,true);
    excelrep.execute(exceltype,nil);
end;

procedure TFrm_report.RzGroup2Items0Click(Sender: TObject);
var csql :string;
begin
   cSql:='exec JGJSPrj '''+datetostr(dtp_begin.date)+''','
              + ''''+datetostr(dtp_end.date)+''','''+CurCorpCode+'''';
   excelrep.templatefilename:='JGJS';
   exceltype:='';
   qrywork(dm_epm.adoqry_rep,csql,true);
   excelrep.execute(exceltype,nil);
end;

end.
