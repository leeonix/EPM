program Encrypt;

uses
  Forms,
  uEncryptUserpwd in 'uEncryptUserpwd.pas' {Form3},
  UMD5 in 'UMD5.pas';

{$R *.res}

begin
  Application.Initialize;
 // Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
