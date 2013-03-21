unit frm_exportcontractlist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,dm,StdCtrls, Mask, RzEdit, Buttons, MyReport, DB, ADODB, ExtCtrls,
  RzPanel, RzRadGrp;

type
  Tfrm_contractlist = class(TForm)
    Label10: TLabel;
    startdate: TRzDateTimeEdit;
    Label11: TLabel;
    enddate: TRzDateTimeEdit;
    excelrep: TMyReport;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    ADOQuery1: TADOQuery;
    RzCheckGroup1: TRzCheckGroup;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_contractlist: Tfrm_contractlist;

implementation

{$R *.dfm}

procedure Tfrm_contractlist.BitBtn1Click(Sender: TObject);
var csql,exceltype,orderby,whereby :string;
begin
  Screen.Cursor := crHourGlass;
  if RzCheckGroup1.ItemChecked[0] then
   begin
     cSql:='select TypeName, PRJACCOUNT,PrjName, sghtbh,''张峰'' as cbr,Sgdw,PrintDate,Htje,Jhkgrq,Jhjgrq from ARRANGE a';
     excelrep.templatefilename:='contractlist';
     orderby :='sghtbh';
     whereby := ' and sghtbh<>''''';
     csql := csql  +'  inner join PROJECTINFO b  on a.PrjCode = b.PRJCODE inner join projecttype c on b.prjtype=c.PRJTYPECODE   '
             +' where PrintDate>='''+datetostr(startdate.date)+''''
             +' and  PrintDate<='''+datetostr(enddate.date)+''''
             + whereby
             + ' order by PrintDate,';
     csql := csql  + orderby;
     exceltype:='';
     qrywork(ADOQuery1,csql,true);
     excelrep.execute(exceltype,nil);
   end;
   if RzCheckGroup1.ItemChecked[1] then
   begin
     cSql:='select  TypeName, PRJACCOUNT,PrjName, chhtbh,''张峰'' as cbr, chdw,PrintDate,chf from ARRANGE a';
     orderby :='chhtbh';
     whereby := ' and chhtbh<>''''';
     excelrep.templatefilename:='chcontractlist';
     csql := csql  +'  inner join PROJECTINFO b  on a.PrjCode = b.PRJCODE inner join projecttype c on b.prjtype=c.PRJTYPECODE '
             +' where PrintDate>='''+datetostr(startdate.date)+''''
             +' and  PrintDate<='''+datetostr(enddate.date)+''''
             + whereby
             + ' order by PrintDate,'
             + orderby;
     exceltype:='';
     qrywork(ADOQuery1,csql,true);
     excelrep.execute(exceltype,nil);
   end;
   if RzCheckGroup1.ItemChecked[2] then
   begin
     cSql:='select TypeName, PRJACCOUNT,PrjName, jlhtbh,''张峰'' as cbr,jldw,PrintDate,jlfee from ARRANGE a';
     orderby :='jlhtbh';
     whereby := ' and jlhtbh<>''''';
     excelrep.templatefilename:='jlcontractlist';
     csql := csql  +'  inner join PROJECTINFO b  on a.PrjCode = b.PRJCODE inner join projecttype c on b.prjtype=c.PRJTYPECODE '
                   +' where PrintDate>='''+datetostr(startdate.date)+''''
                   +' and  PrintDate<='''+datetostr(enddate.date)+''''
                   + whereby
                   + ' order by PrintDate,'
                   + orderby;
    exceltype:='';
    qrywork(ADOQuery1,csql,true);
    excelrep.execute(exceltype,nil);
   end;
  if RzCheckGroup1.ItemChecked[3] then
   begin
     cSql:='select TypeName, Erpcode,PrjName, htbh,''张峰'' as cbr,stdw,qdrq,htje from DESCONTRACT a';
     excelrep.templatefilename:='descontractlist';
     orderby :='htbh';
     whereby := ' and htbh<>''''';
     csql := csql  +'   inner join projecttype c on a.prjtype=c.PRJTYPECODE   '
             +' where qdrq>='''+datetostr(startdate.date)+''''
             +' and  qdrq<='''+datetostr(enddate.date)+''''
             + whereby
             + ' order by qdrq,';
     csql := csql  + orderby;
     exceltype:='';
     qrywork(ADOQuery1,csql,true);
     excelrep.execute(exceltype,nil);
   end;
   Screen.Cursor := crDefault;
end;

procedure Tfrm_contractlist.FormCreate(Sender: TObject);
begin
  startdate.Date := Date;
  enddate.Date := Date;
end;

end.
