unit Ubuddetail;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,dm,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, Variants,
  cxEdit, DB, cxDBData, ADODB, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, ExtCtrls, Buttons, RzSpnEdt;

type
  Tfram_buddetail = class(TFrame)
    Panel1: TPanel;
    Label1: TLabel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView2: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    adqry_bud: TADOQuery;
    ds_bud: TDataSource;
    cxGrid1DBTableView1BudItem: TcxGridDBColumn;
    cxGrid1DBTableView1BudFee: TcxGridDBColumn;
    ds_detail: TDataSource;
    adqry_buddetail: TADOQuery;
    cxGrid1DBTableView2detailfee: TcxGridDBColumn;
    cxGrid1DBTableView2Itemname: TcxGridDBColumn;
    cxGrid1Level2: TcxGridLevel;
    RzRapidFireButton1: TRzRapidFireButton;
    procedure cxGrid1DBTableView2TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems0GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure RzRapidFireButton1Click(Sender: TObject);
  private
    Fprjcode:string;
    { Private declarations }
  public
     procedure Init(prjcode:string);
    { Public declarations }
  end;

implementation

uses Prj_Design;


procedure Tfram_buddetail.Init(prjcode:string);
var V:variant;
begin
  Fprjcode := prjcode;
  adqry_bud.Close;
  adqry_bud.Parameters.ParamByName('code').Value :=prjcode;
  adqry_bud.Open;
  adqry_buddetail.Active:= true;
  
end;


{$R *.dfm}

procedure Tfram_buddetail.cxGrid1DBTableView2TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems0GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
  var Fee:integer;
var csql,budgetid:String;
begin
  budgetid := adqry_bud.fieldByName('Budgetid').AsString ;
  csql := 'select sum(detailfee) as sumfee from buddetail a inner join buditemcode b on a.buditemid=b.buditemid  where budgetid='''+budgetid+''' and b.calflag=0'  ;
  QryWork(Dm_Epm.adoqry_pub,csql);
  if not VarIsNull(AValue)  then
     begin
       Fee :=  adqry_bud.FieldByName('BudFee').Value-Dm_Epm.adoqry_pub.FieldValues['sumfee'];
       AText := '安装合同金额：'+ inttostr(Fee);
     end;

end;

procedure Tfram_buddetail.RzRapidFireButton1Click(Sender: TObject);
var csql,ctype,budgetid:string;


begin
  if (Frm_PrjDesign.prjtype ='代工')  or  (Frm_PrjDesign.prjtype ='业扩') then
  ctype :='用户'
  else ctype := '电业'    ;
  budgetid:=adqry_bud.FieldByName('BudgetId').AsString;
  cSql := 'exec InsertBuddetail '+budgetid+','''+ctype+'''';
  QryWork(Dm_Epm.adoqry_input,csql,False);
  adqry_bud.DisableControls;
  adqry_buddetail.DisableControls;
  adqry_bud.Close;
  adqry_buddetail.Close;
  adqry_bud.Open  ;
  adqry_buddetail.Open;
  adqry_bud.EnableControls;
  adqry_buddetail.EnableControls;
  RzRapidFireButton1.Enabled := False;
end;

end.
