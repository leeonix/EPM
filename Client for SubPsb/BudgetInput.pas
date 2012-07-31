unit BudgetInput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons,pubvar,dm;

type
  TFrm_InputBud = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edt_budfee: TEdit;
    Edt_desfee: TEdit;
    Edt_k1: TEdit;
    cbx_item: TComboBox;
    Bitn_savenew: TBitBtn;
    Bitn_saveclose: TBitBtn;
    Bitn_close: TBitBtn;
    Bevel1: TBevel;
    StaticText1: TStaticText;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Bitn_closeClick(Sender: TObject);
    procedure Bitn_savecloseClick(Sender: TObject);
    procedure Bitn_savenewClick(Sender: TObject);
  private

    function CheckInput():Boolean;
    function InputBud():Boolean;

    { Private declarations }
  public
      Originitem:string;
      Prjcode:string;
      InputMode:integer;
    { Public declarations }
  end;

var
  Frm_InputBud: TFrm_InputBud;


implementation

{$R *.dfm}

procedure TFrm_InputBud.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13  then
   SelectNext(ActiveControl,True,True);
end;

procedure TFrm_InputBud.Bitn_closeClick(Sender: TObject);
begin
  close;
end;

function TFrm_InputBud.CheckInput: Boolean;
begin
  Result:=False;
  if (trim(cbx_item.Text)='') or (trim(Edt_budfee.Text)='') or
     (trim(edt_desfee.Text)='') then
  begin
     showmessage('请检查输入信息完整性');
     exit;
  end;
  Result:=true;
end;

procedure TFrm_InputBud.Bitn_savecloseClick(Sender: TObject);
begin
  if CheckInput then
  Begin
   if InputBud then
   ModalResult:=mrok;
  end;
end;

procedure TFrm_InputBud.Bitn_savenewClick(Sender: TObject);
begin
  if CheckInput then
  begin
    if  InputBud then
    begin
      cbx_item.Text:='';
      edt_budfee.Text:='';
      edt_desfee.Text:='';
      edt_k1.Text:='';
      cbx_item.SetFocus;
    end;
  end;
end;

function TFrm_InputBud.InputBud: Boolean;
var cSql:string;
    budfee,desfee,k1:string;
begin
   budfee:=trim(Edt_BudFee.Text);
   desfee:=trim(Edt_DesFee.Text);
   k1:=trim('0'+Edt_k1.Text);
   if InputMode=NewMode then
   cSql:='exec InsertBud '''+PrjCode+''','''+Trim(cbx_item.Text)+''','+BudFee+','
         +DesFee+','+k1
   else if InputMode=EditMode then
   cSql:='exec UpdateBud '''+prjcode+''','''+Trim(cbx_Item.Text)+''','''+OriginItem+''','+BudFee+','
         +desfee+','+k1;
   try
     Qrywork(dm_epm.adoqry_input,Csql,False);
   except
     MessageDlg(ErrorHint,mtError,[mbOk], 0);
     Result:=False;
     exit;
   end;
   Result:=True;
end;

end.
