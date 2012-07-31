unit frm_sgdw;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  dm, Dialogs, DB, ExtCtrls, DBCtrls, Grids, DBGrids, ADODB;

type
  Tfrm_contractcompany = class(TForm)
    ADOQuery1: TADOQuery;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure ADOQuery1AfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_contractcompany: Tfrm_contractcompany;

implementation

{$R *.dfm}

procedure Tfrm_contractcompany.ADOQuery1AfterInsert(DataSet: TDataSet);
begin
   ADOQuery1.FieldByName('AuxFlag').AsString := '2';
end;

procedure Tfrm_contractcompany.FormCreate(Sender: TObject);
begin
  adoquery1.Active := true;
end;

end.
