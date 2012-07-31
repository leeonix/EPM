unit Ufrm_flow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Udm,
  Dialogs, StdCtrls, Mask, RzEdit, ExtCtrls, RzDlgBtn, DB, DBClient,
  DBCtrls, RzDBEdit, RzBorder, RzLabel, ADODB;

type
  Tfrm_flow = class(TForm)
    RzDialogButtons1: TRzDialogButtons;
    RzLabel1: TRzLabel;
    RzBorder1: TRzBorder;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzDe_flowname: TRzDBEdit;
    RzDBEdit2: TRzDBEdit;
    RzDBDateTimeEdit1: TRzDBDateTimeEdit;
    RzDBMemo1: TRzDBMemo;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure RzDialogButtons1ClickOk(Sender: TObject);
    procedure ADOQuery1BeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    FlowCode:String;
  
    { Public declarations }
  end;

var
  frm_flow: Tfrm_flow;

implementation

{$R *.dfm}



procedure Tfrm_flow.FormShow(Sender: TObject);
begin
  if FlowCode <>'' then
  begin
     ADOQuery1.Close;
     ADOQuery1.Parameters.ParamByName('code').Value :=FlowCode;
     ADOQuery1.Open;
  end;
end;

procedure Tfrm_flow.RzDialogButtons1ClickOk(Sender: TObject);
begin
  ADOQuery1.Post;
end;

procedure Tfrm_flow.ADOQuery1BeforePost(DataSet: TDataSet);
begin
  ADOQuery1.FieldByName('flowcode').AsString := FlowCode;
end;

end.
