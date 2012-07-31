unit bdjgrep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, ADODB;

type
  TFrm_bdjgrep = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape21: TQRShape;
    QRShape23: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape22: TQRShape;
    QRShape20: TQRShape;
    QRShape24: TQRShape;
    QRShape27: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape28: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    qrdbtxt_prjacc: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBRichText1: TQRDBRichText;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    yl: TQRLabel;
    hg: TQRLabel;
    bhg: TQRLabel;
    ADOQuery1: TADOQuery;
    ADOQuery1PRJCODE: TStringField;
    ADOQuery1PRJTYPE: TStringField;
    ADOQuery1PRJNAME: TStringField;
    ADOQuery1PRJACCOUNT: TStringField;
    ADOQuery1SGDW: TStringField;
    ADOQuery1KGRQ: TDateTimeField;
    ADOQuery1JGRQ: TDateTimeField;
    ADOQuery1YSBM: TStringField;
    ADOQuery1YSRQ: TDateTimeField;
    ADOQuery1PJ_YL: TStringField;
    ADOQuery1PJ_HG: TStringField;
    ADOQuery1PJ_BHG: TStringField;
    ADOQuery1YS: TStringField;
    ADOQuery1BZ: TStringField;
    ADOQuery1JH: TStringField;
    ADOQuery1ZJLY: TStringField;
    ADOQuery1PZTZ: TStringField;
    QRDBRichText2: TQRDBRichText;
    ADOQuery1YSQK: TMemoField;
    ADOQuery1SBZJ: TMemoField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_bdjgrep: TFrm_bdjgrep;

implementation

{$R *.dfm}

end.
