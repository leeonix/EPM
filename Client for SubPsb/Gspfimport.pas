unit Gspfimport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,  dm,
  Dialogs, RzButton, ExtCtrls, RzPanel, StdCtrls, RzLabel, DB, Grids, DBGrids,nexcel,
  ADODB, RzLstBox;

type
  Tfrm_importGspf = class(TForm)
    rzpnl1: TRzPanel;
    rzpnl2: TRzPanel;
    btn_import: TRzButton;
    ADOQuery1: TADOQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    RzPanel1: TRzPanel;
    RzLabel2: TRzLabel;
    RzLabel1: TRzLabel;
    RzButton1: TRzButton;
    RzButton2: TRzButton;
    OpenDialog1: TOpenDialog;
    ADOQuery1PCName: TWideStringField;
    ADOQuery1PWName: TWideStringField;
    ADOQuery1PRJACCOUNT: TStringField;
    ADOQuery1PRJNAME: TStringField;
    ADOQuery1Sumfee: TIntegerField;
    ADOQuery1Jzfee: TIntegerField;
    ADOQuery1Azfee: TIntegerField;
    ADOQuery1Sbfee: TIntegerField;
    ADOQuery1Qtfee: TIntegerField;
    ADOQuery1Ybfee: TIntegerField;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzListBox1: TRzListBox;
    RzLabel5: TRzLabel;
    Label1: TLabel;
    lbllable1: TLabel;
    procedure btn_importClick(Sender: TObject);
    procedure RzButton2Click(Sender: TObject);
  private
    function  UpdateDb(prjaccount,pfno,sumfee,jzfee,azfee,sbfee,qtfee,ybfee,wzfee:string):boolean;
    function  UpdateGSPF(pcname,pwname:string):Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_importGspf: Tfrm_importGspf;

implementation

{$R *.dfm}
 //从excel表格中概算批复清单导入
procedure Tfrm_importGspf.btn_importClick(Sender: TObject);
Var Book: IXLSWorkbook;
    ws: IXLSWorksheet;
    Arr: Variant ;
    psno,I,rowcount :Integer;
    Pcname,pwname, prjaccount,sumfee,jzfee,azfee,sbfee,qtfee,ybfee,wzjgfee :string;
begin
  if OpenDialog1.Execute then
  begin
    Screen.Cursor := crHourGlass;
    Book :=    TXLSWorkbook.Create();
    Book.Open(OpenDialog1.FileName);
    ws := Book.WorkSheets[1] ;
    rowcount := ws.UsedRange.Rows.Count;
    Pcname :=  VarToStr(ws.Cells.Item[2,2].Value) ;
    pwname :=  VarToStr(ws.Cells.Item[2,3].Value);
    psno:= UpdateGSPF(Pcname,pwname);
    for I := 6 to rowcount-1  do
    begin
       prjaccount := VarToStr(ws.Cells.Item[I,2].Value);
       if prjaccount<>'' then
       begin
         sumfee := VarToStr(ws.Cells.Item[I,4].Value); // 合计概算批复
         azfee := VarToStr( ws.Cells.Item[I,6].Value); //安装费
         jzfee := VarToStr(ws.Cells.Item[I,5].Value); // 建筑费
         sbfee := VarToStr(ws.Cells.Item[I,7].Value);  // 设备费
         qtfee := VarToStr(ws.Cells.Item[I,8].Value);  //  其他费
         ybfee := VarToStr(ws.Cells.Item[I,9].Value);  // 预备费用
         wzjgfee :=  VarToStr(ws.Cells.Item[I,10].Value);  // 物资集购费
         sumfee := FloatToStr(StrToFloat(sumfee)*10000);
         azfee := FloatToStr(StrToFloat(azfee)*10000);
         if (jzfee<>'')then jzfee := FloatToStr(StrToFloat(jzfee)*10000) else jzfee:='0';
         sbfee := FloatToStr(StrToFloat(sbfee)*10000);
         qtfee := FloatToStr(StrToFloat(qtfee)*10000);
         ybfee := FloatToStr(StrToFloat(ybfee)*10000);
         if (wzjgfee<>'') then wzjgfee := FloatToStr(StrToFloat(wzjgfee)*10000) else wzjgfee:='0';

         UpdateDb(prjaccount, IntToStr(psno),sumfee,jzfee,azfee,sbfee,qtfee,ybfee,wzjgfee);
       end;
       Next;
    end;
    ADOQuery1.Parameters[0].Value := psno;
    ADOQuery1.Active := false;
    ADOQuery1.Active := True;
    RzLabel4.Caption := Pcname ;
    RzLabel3.Caption := pwname;
    screen.Cursor := crDefault;
    ShowMessage('excel表格数据已经成功导入并更新');
  end;
end;

procedure Tfrm_importGspf.RzButton2Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

function Tfrm_importGspf.UpdateDb(prjaccount, pfno, sumfee, jzfee, azfee, sbfee,
  qtfee, ybfee, wzfee: string): boolean;
var prjcode,csql, cInsertSql,cUPdateSql:string;
const Insertsql = 'INSERT INTO ProjectPS (prjcode,psno,sumfee,jzfee,azfee,sbfee,qtfee,ybfee,wzjgfee) '
     +'values(''%S'',''%S'',''%S'',''%S'',''%S'',''%S'',''%S'',''%S'',''%S'')';
const Updatesql ='UPDATE ProjectPS SET psno=''%S'', jzfee=''%S'',sumfee = ''%S'',azfee=''%S'',sbfee=''%S'',qtfee=''%S'',ybfee=''%S'',wzjgfee=''%S'''
       +' where prjcode =''%S''';
begin
    csql:= 'select prjcode from Projectinfo where prjaccount = '''+prjaccount+'''' ;
    QryWork(csql);
    prjcode :=  Dm_Epm.adoqry_pub.FieldByName('prjcode').AsString;
    if Dm_Epm.adoqry_pub.IsEmpty then
    begin
      RzListBox1.Items.Add(prjaccount);
      Result:= False;
      Exit;
    end;
    csql :=   'select prjcode from ProjectPS where prjcode = '''+prjcode+'''' ;
     QryWork(csql);
    if  Dm_Epm.adoqry_pub.IsEmpty then
    begin
       cInsertSql :=  Format(Insertsql,[prjcode,pfno,sumfee,jzfee,azfee,sbfee,qtfee,ybfee,wzfee]);
       QryWork(cInsertSql,false);
    end else
    begin
          cUPdateSql := Format(Updatesql,[pfno,jzfee,sumfee,azfee,sbfee,qtfee,ybfee,wzfee,prjcode]);
          QryWork(cUPdateSql,false);
    end;
    Result := true;
end;

function Tfrm_importGspf.UpdateGSPF(pcname, pwname: string): Integer;
var csql, cInsertSql,cUPdateSql:string;
const Insertsql = 'INSERT INTO Gspw (pcname,pwname) '
     +'values(''%S'',''%S'')';
begin
    csql:= 'select psno from Gspw where pcname = '''+pcname+'''' ;
    QryWork(csql);
    if  Dm_Epm.adoqry_pub.IsEmpty then
    begin
       cInsertSql :=  Format(Insertsql,[pcname,pwname]);
       QryWork(cInsertSql,false);
       csql := 'select psno from gspw where pcname='''+pcname+'''';
       QryWork(csql);
    end;
    Result :=   Dm_Epm.adoqry_pub.FieldByName('psno').AsInteger;


end;

end.
