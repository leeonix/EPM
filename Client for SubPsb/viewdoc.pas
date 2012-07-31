unit Viewdoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls; //AUTOVUEXLib_TLB;

type
  TFrm_Viewdoc = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
   // AutoVueXdoc: TAutoVueX;
    { Private declarations }
  public
    filename: string;
    { Public declarations }
  end;

var
  Frm_Viewdoc: TFrm_Viewdoc;

implementation

{$R *.dfm}

procedure TFrm_Viewdoc.FormCreate(Sender: TObject);
begin
//  AutoVueXdoc := TAutoVueX.Create(self);
//  AutoVueXdoc.Parent := self;
//  AutoVueXdoc.Align := alclient;
//  AutoVueXdoc.Visible := true;
end;

procedure TFrm_Viewdoc.FormShow(Sender: TObject);
begin
  //AutoVueXdoc.SRC := filename;
end;

end.
