unit importbudget;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dm,StrUtils,
  Dialogs, StdCtrls, Buttons, nexcel;

type
  Tfrm_importbudget = class(TForm)
    OpenDialog1: TOpenDialog;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private

    { Private declarations }
  public
 //  function  UpdateDb(prjaccount,jlf,chf,htje,acf,sjf,sumfee,jldw,sgdw:string):boolean; overload;
   function  UpdateDb(prjaccount,jlf,chf,htje,acf,sjf,sumfee,prjtype,jsrq:string):boolean ;
   function UpdateDesignContract(erpcode,sjdw,prjacc:string):boolean;
    { Public declarations }
  end;

var
  frm_importbudget: Tfrm_importbudget;

implementation

{$R *.dfm}
 // import budget excel file
procedure Tfrm_importbudget.BitBtn1Click(Sender: TObject);
Var Book: IXLSWorkbook;
    ws: IXLSWorksheet;
    Arr: Variant ;
    I,rowcount :Integer;
    Erpcode, prjaccount,jlf,chf,htje,acf,sjf,sumfee,sjdw,chdw,jldw,sgdw,jsrq :string;
    prjtypename,prjtype:string;
begin
  if OpenDialog1.Execute then
  begin
    Screen.Cursor := crHourGlass;
    Book :=    TXLSWorkbook.Create();
    Book.Open(OpenDialog1.FileName);
    ws := Book.WorkSheets[1] ;
    rowcount := ws.UsedRange.Rows.Count;
    for I := 4 to rowcount  do
    begin
       prjaccount := VarToStr(ws.Cells.Item[I,3].Value);
       if prjaccount<>'' then
       begin
         jlf := VarToStr(ws.Cells.Item[I,24].Value); // 监理费
         chf := VarToStr( ws.Cells.Item[I,12].Value); //测绘费
         htje := VarToStr(ws.Cells.Item[I,42].Value); // 施工
         acf := VarToStr(ws.Cells.Item[I,43].Value);  //  文明措施费
         sjf := VarToStr(ws.Cells.Item[I,32].Value);  //  设计费
         sumfee := VarToStr(ws.Cells.Item[I,7].Value);  // 预算总费用
         chdw :=  VarToStr(ws.Cells.Item[I,54].Value);  // 测绘单位
         jldw :=  VarToStr(ws.Cells.Item[I,55].Value);  // 监理单位
         sjdw :=  VarToStr(ws.Cells.Item[I,56].Value);  // 设计单位
         sgdw :=  VarToStr(ws.Cells.Item[I,57].Value);  // 安装施工单位
         prjtypename := VarToStr(ws.Cells.Item[I,58].Value); // 合同价款表格中的工程性质名称
         jsrq :=  VarToStr(ws.Cells.Item[I,50].Value);      //4.25增加结算日期导入字段

         if prjtypename='业扩' then prjtype:='002';
         if prjtypename='代工' then prjtype:='001';
         if prjtypename='平方米' then prjtype:='010';
         if prjtypename='更改' then prjtype:='006';
         if prjtypename='基建' then prjtype:='004';
         if prjtypename='业扩配套' then prjtype :='007';

         if ContainsStr(prjaccount,'-') then
           Erpcode := Copy(prjaccount,1,Pos('-',prjaccount)-1);
         UpdateDb(prjaccount,jlf,chf,htje,acf,sjf,sumfee,prjtype,jsrq);
         if trim(sjdw)<>'' then  UpdateDesignContract(Erpcode,sjdw,prjaccount) ;
       end;
       Next;
    end;
    screen.Cursor := crDefault;
    ShowMessage('excel表格数据已经成功导入并更新');
  end;
end;
   

function Tfrm_importbudget.UpdateDb(prjaccount, jlf, chf, htje, acf, sjf,sumfee,prjtype,jsrq: string): boolean;
var csql, cInsertSql,cUPdateSql,prjcode:string;
const Insertsql = 'INSERT INTO ARRANGE (PrjCode,sgdw,Htje,Jlf,Chf,Jlfee,Sjf,sumfee) '
     +'values(''%S'',''%S'',''%S'',''%S'',''%S'',''%S'',''%S'',''%S'')';
const Updatesql ='UPDATE ARRANGE SET htje=''%S'',Jlf = ''%S'',chf=''%S'',jlfee=''%S'',sjf=''%S'',sumfee=''%S'',jsrq=''%S'''
       +' where prjcode =''%S''';
const UpdateprjType ='Update projectinfo set prjtype=''%S'' where prjcode =''%S''';
begin
    if (Pos('-',prjaccount)>12) then
    csql:= 'select prjcode from projectinfo where LEFT(RTRIM(LTRIM(PRJACCOUNT)),12)+ RIGHT(RTRIM(LTRIM(PRJACCOUNT)),LEN(RTRIM(LTRIM(PRJACCOUNT)))- CHARINDEX('''
        +'-'+''',RTRIM(LTRIM(PRJACCOUNT)))+1) =  '''+prjaccount+''''
    else  if (Length(prjaccount)=12) then
    csql:= 'select prjcode from projectinfo where   LEFT(RTRIM(LTRIM(PRJACCOUNT)),12) =  '''+prjaccount+''''
    else
     csql:= 'select prjcode from projectinfo where RTRIM(LTRIM(PRJACCOUNT)) =  '''+prjaccount+'''' ;
    QryWork(csql);
    prjcode :=  Dm_Epm.adoqry_pub.FieldByName('prjcode').AsString;
    if  Dm_Epm.adoqry_pub.IsEmpty then
    begin
        ShowMessage('帐号:'+prjaccount+'与EPM里不匹配或者不存在，未能导入该条表格记录,请检查');
        exit;
    end;
    //
    csql := 'select prjcode,sgdw,jldw from arrange where prjcode = '''+prjcode+'''';
    QryWork(csql);
    if  Dm_Epm.adoqry_pub.IsEmpty then
    begin
       cInsertSql :=  Format(Insertsql,[prjcode,'请选择施工单位',htje,acf,chf,jlf,sjf,sumfee]);
       QryWork(cInsertSql,false);
       if prjtype<>'' then
       begin
          cUPdateSql := Format(UpdateprjType,[prjtype,prjcode]);
          QryWork(cUPdateSql,false);
       end;
    end else
    begin
          cUPdateSql := Format(Updatesql,[htje,acf,chf,jlf,sjf,sumfee,jsrq, prjcode]);
          QryWork(cUPdateSql,false);
          //根据表格中的工程性质修改同步epm中的工程性质
          if prjtype<>'' then
          begin
              cUPdateSql := Format(UpdateprjType,[prjtype,prjcode]);
              QryWork(cUPdateSql,false);
          end;
    end;
    Result := true;
end;

function Tfrm_importbudget.UpdateDesignContract(erpcode, sjdw,prjacc:string): boolean;
var csql, cInsertSql,cUPdateSql,prjname,prjtype:string;
const Insertsql = 'INSERT INTO DESCONTRACT (Erpcode,stdw,PrjName,Prjtype) '
     +'values(''%S'',''%S'',''%S'',''%S'')';
const updatesql ='update descontract set stdw=''%S'' , prjname=''%S'', prjtype=''%S'' where erpcode=''%S''';

begin
 if (Pos('-',prjacc)>12) then
    csql:= 'select prjname,PRJTYPE from projectinfo where LEFT(RTRIM(LTRIM(PRJACCOUNT)),12)+ RIGHT(RTRIM(LTRIM(PRJACCOUNT)),LEN(RTRIM(LTRIM(PRJACCOUNT)))- CHARINDEX('''
        +'-'+''',RTRIM(LTRIM(PRJACCOUNT)))+1) =  '''+prjacc+''''
    else  if (Length(prjacc)=12) then
    csql:= 'select prjname,PRJTYPE from projectinfo where   LEFT(RTRIM(LTRIM(PRJACCOUNT)),12) =  '''+prjacc+''''
    else
    csql:= 'select prjname,PRJTYPE from projectinfo where  RTRIM(LTRIM(PRJACCOUNT)) = '''+prjacc+'''' ;
    QryWork(csql);
    prjname :=  Dm_Epm.adoqry_pub.FieldByName('prjname').AsString;
    prjtype := Dm_Epm.adoqry_pub.FieldByName('PRJTYPE').AsString;
    if  Dm_Epm.adoqry_pub.IsEmpty then
    begin
        ShowMessage('帐号:'+prjacc+'与EPM里不匹配或者不存在，不能导入设计合同数据');
        exit;
    end;
    csql:= 'select Erpcode from DESCONTRACT where Erpcode = '''+erpcode+'''' ;
    QryWork(csql);
    if  Dm_Epm.adoqry_pub.IsEmpty then
    begin
       cInsertSql :=   Format(Insertsql,[erpcode,sjdw,prjname,prjtype]);
       QryWork(cInsertSql,false);
    end else
    begin
       cUPdateSql:= Format(updatesql,[sjdw,prjname,prjtype,erpcode])  ;
       QryWork(cUPdateSql,false);
    end;
    Result := true;
end;

end.
