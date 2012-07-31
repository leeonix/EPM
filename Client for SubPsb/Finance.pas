unit Finance;

interface

uses
  Windows, Messages,SysUtils,Classes,Graphics,Controls,Forms,Dialogs,
  ExtCtrls, StdCtrls, ComCtrls,dm,pubvar,DB, ADODB, Grids, DBGrids;

type
  TFram_Finance = class(TFrame)
    DBGrid1: TDBGrid;
    ADOqry_BUD: TADOQuery;
    ds_finance: TDataSource;
    Panel1: TPanel;
    Bevel1: TBevel;
    Panel2: TPanel;
    StaticText1: TStaticText;
    ADOqry_BUDPRJCODE: TStringField;
    ADOqry_BUDBUDITEM: TStringField;
    ADOqry_BUDBUDFEE: TBCDField;
    ADOqry_BUDFEENUM: TBCDField;
    ADOqry_finance: TADOQuery;
    DataSource1: TDataSource;
    DBGrid2: TDBGrid;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    ADOqry_financeSGDW: TStringField;
    ADOqry_financeSGLB: TStringField;
    ADOqry_financeHTJE: TStringField;
    ADOqry_financeJSJE: TStringField;
    ADOqry_financeJLF: TStringField;
    ADOqry_financeJSRQ: TDateTimeField;
    procedure ADOqry_financeJSRQGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ADOqry_financeJSRQSetText(Sender: TField;
      const Text: String);
  private
    { Private declarations }
  public
    inputmode:Integer;
    projectid:string;
    procedure Init(const Prjcode:string);
    function  SaveInput():Boolean;
    procedure  CancelInput();
    { Public declarations }
  end;

implementation

uses tasktree;

{$R *.dfm}

{ TFram_finance }

procedure TFram_Finance.Init(const Prjcode: string);
var csql:string;
begin
  ProjectId := PrjCode;
  ADOqry_finance.Parameters.ParamByName('MyCode').Value := PrjCode;
  ADOqry_BUD.Parameters.ParamByName('mycode').Value:= prjcode;
  ADOqry_BUD.Active:=true;
  ADOqry_finance.Active := true;
  if UserDepart='财务科' then
   InputMode := NewMode
  else InputMode := EditMode;
end;

procedure TFram_Finance.CancelInput;
begin
   if ADOqry_finance.State= dsedit then
      ADOqry_finance.Cancel;
end;

function TFram_Finance.SaveInput: Boolean;
begin
  Result := False;
  if ADOqry_finance.State= dsedit then
  try
    ADOqry_finance.Post;
  except
    ADOqry_finance.Cancel;
    ShowMessage(ErrorHint);
  end;
  Result:=true;
end;

procedure TFram_Finance.ADOqry_financeJSRQGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
   //Dm_epm.DateFieldGetText(Sender,Text);
end;

procedure TFram_Finance.ADOqry_financeJSRQSetText(Sender: TField;
           const Text: String);
begin
//   if dm_epm.DateFieldSetText(Sender,Text)=False then
//   begin
//     showmessage('日期非法');
//     Abort; {转换不成功,日期非法}
//   end;
end;

end.
