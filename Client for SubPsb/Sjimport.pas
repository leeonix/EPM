unit Sjimport;

interface

uses
  Windows, Messages, SysUtils, DateUtils, Variants, Classes, Graphics, Controls, Forms,dm,nexcel,
  Dialogs, DB, RzButton, ExtCtrls, RzPanel, Grids, DBGrids, ADODB, StdCtrls,
  RzLabel, RzLstBox, RzRadGrp;

type
  Tfrm_importSj = class(TForm)
    dlgOpen1: TOpenDialog;
    qry1: TADOQuery;
    DBGrid1: TDBGrid;
    rzpnl2: TRzPanel;
    btn_import: TRzButton;
    RzButton2: TRzButton;
    DataSource1: TDataSource;
    qry1SjNo: TWideStringField;
    qry1PRJACCOUNT: TStringField;
    qry1TYPENAME: TStringField;
    qry1PRJNAME: TStringField;
    qry1Sgdw: TStringField;
    qry1sghtbh: TStringField;
    qry1Htje: TStringField;
    qry1SsPrice: TIntegerField;
    qry1SjPrice: TIntegerField;
    qry1PrintDate: TDateTimeField;
    qry1Sgkgrq: TDateTimeField;
    qry1Sgjgrq: TDateTimeField;
    qry1JfSjFee: TIntegerField;
    qry1YfSjFee: TIntegerField;
    RzListBox1: TRzListBox;
    RzLabel1: TRzLabel;
    RzRadioGroup1: TRzRadioGroup;
    procedure btn_importClick(Sender: TObject);
    procedure RzButton2Click(Sender: TObject);
  private
    function UpdateDb(prjaccount,sjno,ssprice,sjprice,jfsjfee,yfsjfee:string):Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_importSj: Tfrm_importSj;

implementation

{$R *.dfm}

procedure Tfrm_importSj.btn_importClick(Sender: TObject);
Var Book: IXLSWorkbook;
    ws: IXLSWorksheet;
    Arr: Variant ;
    I,J,rowcount :Integer;
    prjaccount,sjno,ssprice,sjprice,jfsjfee,yfsjfee :string;

begin
  if dlgOpen1.Execute then
  begin
    Screen.Cursor := crHourGlass;
    Book :=    TXLSWorkbook.Create();
    Book.Open(dlgOpen1.FileName);
    if (RzRadioGroup1.ItemIndex=0) then
    begin
      for J := 1 to Book.WorkSheets.Count do
      begin
        ws := Book.WorkSheets[J] ;
        rowcount := ws.UsedRange.Rows.Count;
        for I := 3 to rowcount-1  do
        begin
           prjaccount := VarToStr(ws.Cells.Item[I,3].Value);
           if prjaccount<>'' then
           begin
             sjno := VarToStr(ws.Cells.Item[I,2].Value); // 审计报告编号
             ssprice := VarToStr( ws.Cells.Item[I,8].Value); //送审价格
             sjprice := VarToStr(ws.Cells.Item[I,9].Value); // 审价价格
             jfsjfee := VarToStr(ws.Cells.Item[I,15].Value);  // 甲方审计费
             yfsjfee := VarToStr(ws.Cells.Item[I,16].Value);  //  乙方审计费
             sjprice :=  floattostr(Round(StrToFloat(sjprice))) ;
             ssprice :=  floattostr(Round(StrToFloat(ssprice))) ;
             if (jfsjfee='') then   jfsjfee :='0' ;
             if(yfsjfee='') then   yfsjfee :='0'   ;
             UpdateDb(prjaccount,sjno,ssprice,sjprice,jfsjfee,yfsjfee);
           end;
           Next;
        end;
      end;
    end;
    // 内部审价清单，<10万项目
    if (RzRadioGroup1.ItemIndex=1) then
    begin
      ws := Book.WorkSheets[1] ;
      rowcount := ws.UsedRange.Rows.Count;
      for I := 3 to rowcount  do
        begin
           prjaccount := VarToStr(ws.Cells.Item[I,2].Value);
           if prjaccount<>'' then
           begin
             sjno := '内审'; // 审计报告编号
             ssprice := VarToStr( ws.Cells.Item[I,9].Value); //送审价格
             sjprice := VarToStr(ws.Cells.Item[I,10].Value); // 审价价格
             sjprice :=  floattostr(Round(StrToFloat(sjprice))) ;
             ssprice :=  floattostr(Round(StrToFloat(ssprice))) ;
             jfsjfee :='0' ;
             yfsjfee :='0'   ;
             UpdateDb(prjaccount,sjno,ssprice,sjprice,jfsjfee,yfsjfee);
           end;
           Next;
        end;
    end;
    qry1.Parameters[0].Value := Today;
    qry1.Active := false;
    qry1.Active := True;
    screen.Cursor := crDefault;
    ShowMessage('excel表格数据已经成功导入并更新');
  end;
end;

procedure Tfrm_importSj.RzButton2Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

function Tfrm_importSj.UpdateDb(prjaccount, sjno, ssprice, sjprice, jfsjfee,
  yfsjfee:string): Boolean;
var prjcode,csql, cInsertSql,cUPdateSql,sjdate:string;
const Insertsql = 'INSERT INTO ProjectSj (prjcode,Sjno,ssprice,sjprice,jfsjfee,yfsjfee,sjdate) '
     +'values(''%S'',''%S'',''%S'',''%S'',''%S'',''%S'',''%S'')';
const Updatesql ='UPDATE ProjectSj SET Sjno=''%S'', ssprice=''%S'',sjprice = ''%S'',jfsjfee=''%S'',yfsjfee=''%S'''
       +' where prjcode =''%S''';
begin
   // csql:= 'select prjcode from Projectinfo  where prjaccount = '''+prjaccount+'''' ;
    if (Pos('-',prjaccount)>12) then
    csql:= 'select prjcode from projectinfo where LEFT(PRJACCOUNT,12)+ RIGHT(PRJACCOUNT,LEN(PRJACCOUNT)- CHARINDEX('''
        +'-'+''',PRJACCOUNT)+1) =  '''+prjaccount+''''
    else
     csql:= 'select prjcode from projectinfo where  prjaccount like  '''+prjaccount+'%''' ;
    QryWork(csql);
    if  Dm_Epm.adoqry_pub.IsEmpty then
    begin
         RzListBox1.Items.Add(prjaccount);
         result:=False;
         Exit;
    end;
    prjcode :=   Dm_Epm.adoqry_pub.FieldByName('prjcode').AsString;
    csql := 'select prjcode from ProjectSj  where prjcode = '''+prjcode+'''' ;
     QryWork(csql);
    if  Dm_Epm.adoqry_pub.IsEmpty then
    begin
       sjdate := DateToStr(Today);
       cInsertSql :=  Format(Insertsql,[prjcode,sjno,ssprice,sjprice,jfsjfee,yfsjfee,sjdate]);
       QryWork(cInsertSql,false);
    end else
    begin
          cUPdateSql := Format(Updatesql,[sjno,ssprice,sjprice,jfsjfee,yfsjfee,prjcode]);
          QryWork(cUPdateSql,false);
    end;
    Result := true;
end;
end.
