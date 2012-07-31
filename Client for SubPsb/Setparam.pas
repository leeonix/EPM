unit Setparam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,dm,pubvar, StdCtrls, DBCtrls, DB, ADODB, Grids, DBGrids, ExtCtrls;

type
  Tfrm_setpara = class(TForm)
    DBGrid1: TDBGrid;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    DBNavigator1: TDBNavigator;
    Bevel1: TBevel;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_setpara: Tfrm_setpara;

implementation

{$R *.dfm}

procedure Tfrm_setpara.FormCreate(Sender: TObject);
begin
  if not ADOTable1.Active then ADOTable1.Active:=true;
end;

end.
