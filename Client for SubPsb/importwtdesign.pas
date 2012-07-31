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
         PrjName := VarToStr(ws.Cells.Item[I,3].Value); // 工程名称
         DesignCompany := VarToStr( ws.Cells.Item[I,6].Value); //设计单位
         PrjAdd := VarToStr(ws.Cells.Item[I,5].Value); // 工程地点
         prjaccount := VarToStr(ws.Cells.Item[I,2].Value);  // 工程账号
         prjtypename := VarToStr(ws.Cells.Item[I,4].Value); // 表格中的工程性质名称

         if prjtypename='业扩' then prjtype:='002';
         if prjtypename='代工' then prjtype:='001';
         if prjtypename='平方米' then prjtype:='010';
         if prjtypename='技改' then prjtype:='006';
         if prjtypename='基建' then prjtype:='004';
         if prjtypename='业扩配套' then prjtype :='007';
         InsertWtPrj(Erpcode,prjaccount,prjtype,DesignCompany,PrjAdd,PrjName);
       end;
       Next;
    end;
    screen.Cursor := crDefault;
    ShowMessage('excel表格数据已经成功导入并更新');
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
    Executors.Add('王清扬');
    csql:= 'select prjcode from projectinfo where prjaccount = '''+Erpcode+'''' ;
    QryWork(csql);
    if  Dm_Epm.adoqry_pub.IsEmpty then
    begin
     // 插入总账号
       prjcode :=  Dm_Epm.GetnewitemNo('P002');
       cInsertSql :=   Format(Insertsql,[prjcode,Erpcode,Prjtype,'2',DesignCompany,PrjAdd,PrjName]);
       QryWork(cInsertSql,false);

       settasknode(prjcode,'040401','',Executors);
       dm_epm.setflowlog(prjcode,'','导入委托设计项目',
                            '040401',loginuser,Executors);
       csql:= 'select prjcode from projectinfo where prjaccount = '''+Prjaccount+'''' ;
       QryWork(Dm_Epm.adoqry_input,csql,True);
       if  Dm_Epm.adoqry_input.IsEmpty then
       begin
         // 插入子工程账号项目
         parentcode := prjcode;
         prjcode :=  Dm_Epm.GetnewitemNo('P002');
         cInsertSql :=   Format(InsertsubSql,[prjcode,Prjaccount,Prjtype,'2',DesignCompany,PrjAdd,PrjName,parentcode,parentcode]);
         QryWork(cInsertSql,false);

         settasknode(prjcode,'040401','',Executors);
         dm_epm.setflowlog(prjcode,'','导入委托设计子项目',
                              '040401',loginuser,Executors);
       end;
    end else
    begin
       csql:= 'select prjcode from projectinfo where prjaccount = '''+Prjaccount+'''' ;
       QryWork(Dm_Epm.adoqry_input,csql,True);
       if  Dm_Epm.adoqry_input.IsEmpty then
       begin
       //插入子账号
         parentcode :=  Dm_Epm.adoqry_pub.FieldByName('prjcode').AsString;
         prjcode :=  Dm_Epm.GetnewitemNo('P002');
         cInsertSql :=   Format(InsertsubSql,[prjcode,Prjaccount,Prjtype,'2',DesignCompany,PrjAdd,PrjName,parentcode,parentcode]);
         QryWork(cInsertSql,false);

         settasknode(prjcode,'040401','',Executors);
         dm_epm.setflowlog(prjcode,'','导入委托设计子项目',
                              '040401',loginuser,Executors);
       end;
    end;
    Executors.Free;
    Result := true;
end;
end.
