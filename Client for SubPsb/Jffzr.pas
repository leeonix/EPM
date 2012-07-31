unit Jffzr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, RzButton, cxLabel, cxTextEdit, cxDBEdit, DB, Grids,
  DBGrids, ADODB, ExtCtrls, RzPanel;

type
  Tfrm_jffzr = class(TForm)
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ADOQuery1ID: TAutoIncField;
    ADOQuery1Name: TWideStringField;
    cxDBTextEdit1: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    RzButton1: TRzButton;
    RzButton2: TRzButton;
    RzButton3: TRzButton;
    RzButton4: TRzButton;
    RzGroupBox1: TRzGroupBox;
    RzSpacer1: TRzSpacer;
    procedure RzButton2Click(Sender: TObject);
    procedure RzButton3Click(Sender: TObject);
    procedure RzButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_jffzr: Tfrm_jffzr;

implementation

{$R *.dfm}

procedure Tfrm_jffzr.FormCreate(Sender: TObject);
begin
 if not  ADOQuery1.Active then ADOQuery1.Active := true;
end;

procedure Tfrm_jffzr.RzButton1Click(Sender: TObject);
begin
  ADOQuery1.Delete;
end;

procedure Tfrm_jffzr.RzButton2Click(Sender: TObject);
begin
  ADOQuery1.Insert;
end;

procedure Tfrm_jffzr.RzButton3Click(Sender: TObject);
begin
  if (ADOQuery1.State = dsInsert) or (ADOQuery1.State = dsEdit) then
   ADOQuery1.Post;
end;

end.
