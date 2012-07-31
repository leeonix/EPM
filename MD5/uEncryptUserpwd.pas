unit uEncryptUserpwd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, IniFiles,umd5,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls;

type
  TForm3 = class(TForm)
    cn_epm: TADOConnection;
    Button1: TButton;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
   with ADOQuery1 do
   begin
       First;
       while not  Eof do
       begin
         if   Length(FieldByName('password').AsString)<15 then
         begin
          edit;
          FieldByName('password').Value := MD5Print(MD5String(trim(FieldByName('password').AsString)));
          Update;
         end;

          Next;
       end;
   end;

end;

procedure TForm3.FormCreate(Sender: TObject);
var Appconfig: TIniFile;
begin

  Appconfig:= TIniFile.Create('.\Appconfig.ini');
  try
    cn_epm.ConnectionString := Appconfig.ReadString('SQLConnectionStrings','epmconn','');

  finally
     Appconfig.Free;
  end;
  ADOQuery1.Active := True;
end;

end.
