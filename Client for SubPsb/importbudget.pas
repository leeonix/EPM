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
         jlf := VarToStr(ws.Cells.Item[I,24].Value); // �����
         chf := VarToStr( ws.Cells.Item[I,12].Value); //����
         htje := VarToStr(ws.Cells.Item[I,42].Value); // ʩ��
         acf := VarToStr(ws.Cells.Item[I,43].Value);  //  ������ʩ��
         sjf := VarToStr(ws.Cells.Item[I,32].Value);  //  ��Ʒ�
         sumfee := VarToStr(ws.Cells.Item[I,7].Value);  // Ԥ���ܷ���
         chdw :=  VarToStr(ws.Cells.Item[I,54].Value);  // ��浥λ
         jldw :=  VarToStr(ws.Cells.Item[I,55].Value);  // ����λ
         sjdw :=  VarToStr(ws.Cells.Item[I,56].Value);  // ��Ƶ�λ
         sgdw :=  VarToStr(ws.Cells.Item[I,57].Value);  // ��װʩ����λ
         prjtypename := VarToStr(ws.Cells.Item[I,58].Value); // ��ͬ�ۿ����еĹ�����������
         jsrq :=  VarToStr(ws.Cells.Item[I,50].Value);      //4.25���ӽ������ڵ����ֶ�

         if prjtypename='ҵ��' then prjtype:='002';
         if prjtypename='����' then prjtype:='001';
         if prjtypename='ƽ����' then prjtype:='010';
         if prjtypename='����' then prjtype:='006';
         if prjtypename='����' then prjtype:='004';
         if prjtypename='ҵ������' then prjtype :='007';

         if ContainsStr(prjaccount,'-') then
           Erpcode := Copy(prjaccount,1,Pos('-',prjaccount)-1);
         UpdateDb(prjaccount,jlf,chf,htje,acf,sjf,sumfee,prjtype,jsrq);
         if trim(sjdw)<>'' then  UpdateDesignContract(Erpcode,sjdw,prjaccount) ;
       end;
       Next;
    end;
    screen.Cursor := crDefault;
    ShowMessage('excel��������Ѿ��ɹ����벢����');
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
        ShowMessage('�ʺ�:'+prjaccount+'��EPM�ﲻƥ����߲����ڣ�δ�ܵ����������¼,����');
        exit;
    end;
    //
    csql := 'select prjcode,sgdw,jldw from arrange where prjcode = '''+prjcode+'''';
    QryWork(csql);
    if  Dm_Epm.adoqry_pub.IsEmpty then
    begin
       cInsertSql :=  Format(Insertsql,[prjcode,'��ѡ��ʩ����λ',htje,acf,chf,jlf,sjf,sumfee]);
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
          //���ݱ���еĹ��������޸�ͬ��epm�еĹ�������
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
        ShowMessage('�ʺ�:'+prjacc+'��EPM�ﲻƥ����߲����ڣ����ܵ�����ƺ�ͬ����');
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
