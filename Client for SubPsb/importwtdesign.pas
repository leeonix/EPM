unit importwtdesign;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, dm,pubvar,
  Dialogs, StdCtrls, Buttons,nexcel;

type
  Tfrm_ImportWtDesign = class(TForm)
    btn1: TBitBtn;
    dlgOpen1: TOpenDialog;
    btn2: TBitBtn;
    procedure btn1Click(Sender: TObject);
  private
     function InsertWtPrj(Erpcode,Prjaccount, Prjtype, DesignCompany, PrjAdd, PrjName: string): boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ImportWtDesign: Tfrm_ImportWtDesign;

implementation

{$R *.dfm}

procedure Tfrm_ImportWtDesign.btn1Click(Sender: TObject);
   Var Book: IXLSWorkbook;
    ws: IXLSWorksheet;
    Arr: Variant ;
    I,rowcount :Integer;
    Erpcode, prjaccount, DesignCompany, PrjAdd, PrjName :string;
    prjtypename,prjtype:string;
begin
  if dlgOpen1.Execute then
  begin
    Screen.Cursor := crHourGlass;
    Book :=    TXLSWorkbook.Create();
    Book.Open(dlgOpen1.FileName);
    ws := Book.WorkSheets[1] ;
    rowcount := ws.UsedRange.Rows.Count;
    for I := 4 to rowcount  do
    begin
       Erpcode := VarToStr(ws.Cells.Item[I,1].Value);
       if Erpcode<>'' then
       begin
         PrjName := VarToStr(ws.Cells.Item[I,3].Value); // ��������
         DesignCompany := VarToStr( ws.Cells.Item[I,6].Value); //��Ƶ�λ
         PrjAdd := VarToStr(ws.Cells.Item[I,5].Value); // ���̵ص�
         prjaccount := VarToStr(ws.Cells.Item[I,2].Value);  // �����˺�
         prjtypename := VarToStr(ws.Cells.Item[I,4].Value); // ����еĹ�����������

         if prjtypename='ҵ��' then prjtype:='002';
         if prjtypename='����' then prjtype:='001';
         if prjtypename='ƽ����' then prjtype:='010';
         if prjtypename='����' then prjtype:='006';
         if prjtypename='����' then prjtype:='004';
         if prjtypename='ҵ������' then prjtype :='007';
         InsertWtPrj(Erpcode,prjaccount,prjtype,DesignCompany,PrjAdd,PrjName);
       end;
       Next;
    end;
    screen.Cursor := crDefault;
    ShowMessage('excel��������Ѿ��ɹ����벢����');
  end;
end;


function Tfrm_ImportWtDesign.InsertWtPrj(Erpcode,Prjaccount, Prjtype, DesignCompany, PrjAdd, PrjName: string): boolean;
var csql, cInsertSql,parentcode,prjcode:string;
     Executors:TStringList;
const Insertsql = 'INSERT INTO Projectinfo (PrjCode,Prjaccount,Prjtype,Corpcode,Designcompany,PrjAdd,PrjName) '
     +'values(''%S'',''%S'',''%S'',''%S'',''%S'',''%S'',''%S'')';

     InsertsubSql = 'INSERT INTO Projectinfo (PrjCode,Prjaccount,Prjtype,Corpcode,Designcompany,PrjAdd,PrjName,Parentcode,path) '
     +'values(''%S'',''%S'',''%S'',''%S'',''%S'',''%S'',''%S'',''%S'',''%S'')';

begin
    Executors:=TstringList.Create;
    Executors.Add('������');
    csql:= 'select prjcode from projectinfo where prjaccount = '''+Erpcode+'''' ;
    QryWork(csql);
    if  Dm_Epm.adoqry_pub.IsEmpty then
    begin
     // �������˺�
       prjcode :=  Dm_Epm.GetnewitemNo('P002');
       cInsertSql :=   Format(Insertsql,[prjcode,Erpcode,Prjtype,'2',DesignCompany,PrjAdd,PrjName]);
       QryWork(cInsertSql,false);

       settasknode(prjcode,'040401','',Executors);
       dm_epm.setflowlog(prjcode,'','����ί�������Ŀ',
                            '040401',loginuser,Executors);
       csql:= 'select prjcode from projectinfo where prjaccount = '''+Prjaccount+'''' ;
       QryWork(Dm_Epm.adoqry_input,csql,True);
       if  Dm_Epm.adoqry_input.IsEmpty then
       begin
         // �����ӹ����˺���Ŀ
         parentcode := prjcode;
         prjcode :=  Dm_Epm.GetnewitemNo('P002');
         cInsertSql :=   Format(InsertsubSql,[prjcode,Prjaccount,Prjtype,'2',DesignCompany,PrjAdd,PrjName,parentcode,parentcode]);
         QryWork(cInsertSql,false);

         settasknode(prjcode,'040401','',Executors);
         dm_epm.setflowlog(prjcode,'','����ί���������Ŀ',
                              '040401',loginuser,Executors);
       end;
    end else
    begin
       csql:= 'select prjcode from projectinfo where prjaccount = '''+Prjaccount+'''' ;
       QryWork(Dm_Epm.adoqry_input,csql,True);
       if  Dm_Epm.adoqry_input.IsEmpty then
       begin
       //�������˺�
         parentcode :=  Dm_Epm.adoqry_pub.FieldByName('prjcode').AsString;
         prjcode :=  Dm_Epm.GetnewitemNo('P002');
         cInsertSql :=   Format(InsertsubSql,[prjcode,Prjaccount,Prjtype,'2',DesignCompany,PrjAdd,PrjName,parentcode,parentcode]);
         QryWork(cInsertSql,false);

         settasknode(prjcode,'040401','',Executors);
         dm_epm.setflowlog(prjcode,'','����ί���������Ŀ',
                              '040401',loginuser,Executors);
       end;
    end;
    Executors.Free;
    Result := true;
end;
end.
