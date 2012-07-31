unit UGetFee;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,dm,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, ExtCtrls, StdCtrls,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, ADODB, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  RzBtnEdt, Mask, RzEdit, RzPanel, cxCurrencyEdit, cxCalendar, cxCalc;

type
  TFram_GetFee = class(TFrame)
    Panel1: TPanel;
    Label1: TLabel;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    RzPanel1: TRzPanel;
    Label2: TLabel;
    Label3: TLabel;
    prjname: TRzEdit;
    prjaccount: TRzButtonEdit;
    Label4: TLabel;
    slrq: TRzEdit;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1Level2: TcxGridLevel;
    cxGrid1DBTableView2: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    ADOQuery1prjcode: TStringField;
    ADOQuery1prjaccount: TStringField;
    ADOQuery1prjname: TStringField;
    ADOQuery1sumBud: TBCDField;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    ADOQuery2Prjcode: TStringField;
    ADOQuery2GetFee: TBCDField;
    ADOQuery2GetFdate: TDateTimeField;
    ADOQuery2GetFeeId: TAutoIncField;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    ADOQuery1buditem: TStringField;
    ADOQuery1HaveGet: TBCDField;
    ADOQuery1QF: TFloatField;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid1DBTableView2GetFee: TcxGridDBColumn;
    cxGrid1DBTableView2GetFdate: TcxGridDBColumn;
    procedure prjaccountButtonClick(Sender: TObject);
    procedure prjaccountChange(Sender: TObject);
    procedure ADOQuery2BeforePost(DataSet: TDataSet);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
  private
    FPrjcode:string;
    { Private declarations }
  public
    procedure Init(Parentcode:string);
    { Public declarations }
  end;




implementation


uses UFindPrj;

{$R *.dfm}

const strsql:String='select a.prjcode as prjcode,prjaccount, prjname,budfee as sumBud,buditem ,sum(Getfee) as HaveGet'
                   +' from projectinfo a inner join budget b on a.prjcode=b.prjcode '
                   +'left join GetcustomerFee c on a.prjcode=c.prjcode '
                   +' where  prjtype<>''007''';
                   //' and  or parentcode=''
                   // +' group by a.prjcode,prjaccount,prjname,budfee,buditem' ;

procedure  TFram_GetFee.Init(Parentcode:string);
var strsql:string;
begin
   strsql := 'select prjname,prjaccount from projectinfo where prjcode='''+Parentcode+'''' ;
   QryWork(Dm_Epm.adoqry_pub,strsql);
   FPrjcode:=Parentcode;
   prjname.Text := Dm_Epm.adoqry_pub.fieldbyname('prjname').AsString    ;
   prjaccount.Text := Dm_Epm.adoqry_pub.fieldbyname('prjaccount').AsString;

end;

procedure TFram_GetFee.prjaccountButtonClick(Sender: TObject);
begin
   Application.CreateForm(Tfrm_findprj,frm_findprj);
   try
    if  frm_findprj.ShowModal=mrok then
     if not  frm_findprj.qry_find.IsEmpty then
     begin
       Fprjcode := frm_findprj.qry_find.fieldbyname('prjcode').AsString;
       prjaccount.Text := frm_findprj.qry_find.fieldbyname('prjaccount').AsString;
       prjname.Text :=  frm_findprj.qry_find.fieldbyname('prjname').AsString;
     end;
   finally
     frm_findprj.Free;
   end;
end;

procedure TFram_GetFee.prjaccountChange(Sender: TObject);
begin
   with ADOQuery1 do
   begin
     DisableControls;
     ADOQuery2.DisableControls;
     Close;
     sql.Clear;
     SQL.Add(strsql+' and a.parentcode='''+FPrjcode+''' group by a.prjcode,prjaccount,prjname,budfee,buditem');
     Open;
     if IsEmpty then
     begin
       close;
       SQL.Clear;
       SQL.Add(strsql+' and a.prjcode='''+FPrjcode+''' group by a.prjcode,prjaccount,prjname,budfee,buditem');
       Open;
     end;
     EnableControls;
   end;
   ADOQuery2.Active :=False;
   ADOQuery2.Active := True;
   ADOQuery2.EnableControls;
end;

procedure TFram_GetFee.ADOQuery2BeforePost(DataSet: TDataSet);
begin
  DataSet.FieldByName('Prjcode').AsString := ADOQuery1.fieldByName('prjcode').AsString ;
end;

procedure TFram_GetFee.ADOQuery1CalcFields(DataSet: TDataSet);
begin
  ADOQuery1.FieldByName('Qf').AsInteger := ADOQuery1sumBud.AsInteger-ADOQuery1HaveGet.AsInteger;
end;

end.
