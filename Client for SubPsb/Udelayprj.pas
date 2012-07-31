unit Udelayprj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,pubvar,dm, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ADODB, cxBlobEdit, cxTextEdit, cxDataStorage,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter;

type
  Tfrm_Delayprj = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Ds_Delayprj: TDataSource;
    Adoqry_Delayprj: TADOQuery;
    Adoqry_DelayprjNODENAME: TStringField;
    Adoqry_DelayprjNodeStart: TDateTimeField;
    Adoqry_DelayprjPLANEND: TDateTimeField;
    Adoqry_DelayprjXMDM: TStringField;
    Adoqry_DelayprjPRJACCOUNT: TStringField;
    Adoqry_DelayprjDelayreason: TStringField;
    Adoqry_DelayprjPRJNAME: TStringField;
    Adoqry_DelayprjTYPENAME: TStringField;
    cxGrid1DBTableView1PRJNAME: TcxGridDBColumn;
    cxGrid1DBTableView1PRJACCOUNT: TcxGridDBColumn;
    cxGrid1DBTableView1NODENAME: TcxGridDBColumn;
    cxGrid1DBTableView1TYPENAME: TcxGridDBColumn;
    cxGrid1DBTableView1NodeStart: TcxGridDBColumn;
    cxGrid1DBTableView1PLANEND: TcxGridDBColumn;
    cxGrid1DBTableView1Delayreason: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Delayprj: Tfrm_Delayprj;

implementation

{$R *.dfm}

procedure Tfrm_Delayprj.FormShow(Sender: TObject);
begin
  Adoqry_Delayprj.Active := False;
  Adoqry_Delayprj.Parameters.ParamByName('Loginuser').Value := LoginUser;
  Adoqry_Delayprj.Open;
end;

end.
