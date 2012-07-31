unit Setpwd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask,pubvar,dm;

type
  TFrm_ModPwd = class(TForm)
    Label2: TLabel;
    EDT_NEWPWD: TEdit;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    edt_pwdconfirm: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_ModPwd: TFrm_ModPwd;

implementation

{$R *.dfm}

procedure TFrm_ModPwd.Button1Click(Sender: TObject);
var cSql:string;
begin
  if EDT_NEWPWD.Text<> edt_pwdconfirm.Text then
  begin
     edt_pwdconfirm.SetFocus;
     edt_pwdconfirm.SelectAll;
     showmessage('您输入的两次新口令不一致');
     exit;
  end;
  cSQL:='update employee set PASSWORD='''+edt_newpwd.Text+'''';
  cSQL:=cSQL+' where jobcode='''+userjobid+'''';
  qrywork(dm_epm.adoqry_pub,csql,false);
  showMessage('口令更改成功');
  self.Close;
end;

procedure TFrm_ModPwd.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then SelectNext(ActiveControl,True,true);
end;

end.
