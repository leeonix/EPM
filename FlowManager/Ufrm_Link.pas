unit Ufrm_Link;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Udm,
  Dialogs, ExtCtrls, RzDlgBtn, StdCtrls, RzEdit, RzPanel, RzRadGrp, Mask,
  RzLabel, RzBorder, DB, ADODB;

type
  Tfrm_Link = class(TForm)
    RzDialogButtons1: TRzDialogButtons;
    RzLabel1: TRzLabel;
    Diretip: TRzEdit;
    RzLabel2: TRzLabel;
    RzRadioGroup1: TRzRadioGroup;
    condition: TRzMemo;
    RzBorder1: TRzBorder;
    RzLabel3: TRzLabel;
    qry_Link: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure RzDialogButtons1ClickOk(Sender: TObject);
    procedure qry_LinkBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    LinkNode:string;
    DesNode:string;
    OrgNode:string;
    LinkName:string;
    { Public declarations }
  end;

var
  frm_Link: Tfrm_Link;

implementation

{$R *.dfm}

procedure Tfrm_Link.FormShow(Sender: TObject);
begin
  if LinkNode <> '' then
  with qry_Link do
  begin
    Close;
    Parameters.ParamByName('code').Value := LinkNode;
    Open;
    if not IsEmpty then
    begin
      Diretip.Text := fieldByname('diretip').AsString ;
      condition.Text := fieldByname('condition').AsString;
    end else  Diretip.Text := '';
  end;

end;

procedure Tfrm_Link.RzDialogButtons1ClickOk(Sender: TObject);
begin
  if trim(Diretip.Text)='' then   exit;
  if qry_Link.IsEmpty then qry_Link.Append
   else qry_Link.Edit;
  qry_Link.Post;
end;

procedure Tfrm_Link.qry_LinkBeforePost(DataSet: TDataSet);
begin
  DataSet.FieldByName('direcode').AsString := LinkNode;
  DataSet.FieldByName('sourcetask').AsString := OrgNode;
  DataSet.FieldByName('aimtask').AsString := DesNode;
  DataSet.FieldByName('diretip').AsString :=trim(Diretip.Text);
  DataSet.FieldByName('condition').AsString :=trim(condition.Text);
end;

end.
