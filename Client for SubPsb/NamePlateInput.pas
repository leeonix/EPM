unit NamePlateInput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NamePlate, StdCtrls,pubvar,dm;

type
  Tfrm_InputNameplate = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    Fram_NamePlate1:TFram_NamePlate;
    Procedure Init(InitMode:integer;Prjcode:string);
    { Public declarations }
  end;

var
  frm_InputNameplate: Tfrm_InputNameplate;

implementation

{$R *.dfm}

procedure Tfrm_InputNameplate.Button1Click(Sender: TObject);
begin
  if  Fram_NamePlate1.InputMode=NewMode then
  begin
    try
       if not Fram_NamePlate1.InsertApply then exit
       else Fram_NamePlate1.InsertNameplate;
       //self.ModalResult := mrok;
    except
      showmessage(ErrorHint);
      exit;
    end;
  end
  else if  Fram_NamePlate1.InputMode=EditMode then
  begin
    Fram_NamePlate1.UpdateNameplate;
    //self.ModalResult := Mrok;
  end;
end;

procedure Tfrm_InputNameplate.Init(InitMode: integer;prjcode:string);
begin
  if Fram_NamePlate1=nil then
  begin
     Fram_NamePlate1:=TFram_NamePlate.Create(self);
     Fram_NamePlate1.Parent:=self;
     Fram_NamePlate1.Align := altop;
     Fram_NamePlate1.Visible := true;
     Fram_NamePlate1.Init(prjcode,InitMode);
  end;
end;

procedure Tfrm_InputNameplate.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13  then
   SelectNext(ActiveControl,True,True);
end;

end.
