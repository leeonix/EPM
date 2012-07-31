unit Buddoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DBCtrls, Mask,FmxUtils,pubvar,Budget;

type
  TFrm_buddoc = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label8: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Cb_budtype: TComboBox;
    Edt_version: TEdit;
    Edt_author: TEdit;
    Edt_createdate: TEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_buddoc: TFrm_buddoc;

implementation

{$R *.dfm}

procedure TFrm_buddoc.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
    SelectNext(ActiveControl,True,True);
end;

procedure TFrm_buddoc.FormCreate(Sender: TObject);
begin
  Edt_version.Text:='1';
  Edt_author.Text:=Loginuser;
  Edt_createdate.Text:=datetostr(date);
end;

end.
