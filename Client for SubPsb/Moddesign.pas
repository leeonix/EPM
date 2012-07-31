unit Moddesign;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls;

type
  TFram_Moddesign = class(TFrame)
    Panel1: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    StaticText1: TStaticText;
  private
    { Private declarations }
  public
    prjid:string;
    procedure Init(const Prjcode:string);
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrame1 }

procedure TFram_Moddesign.Init(const Prjcode: string);
begin
//
end;

end.
