unit RptJungong;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls,dm, DB, ADODB, FR_ChBox;

type
  TQrt_ysd = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel5: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape15: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape16: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRLabel25: TQRLabel;
    QRShape21: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel33: TQRLabel;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRLabel38: TQRLabel;
    QRShape30: TQRShape;
    QRLabel39: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRShape31: TQRShape;
    QRLabel51: TQRLabel;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    ADOQuery1: TADOQuery;
    ADOQuery1PRJNAME: TStringField;
    ADOQuery1PRJACCOUNT: TStringField;
    ADOQuery1TYPENAME: TStringField;
    ADOQuery1YSBZ: TStringField;
    ADOQuery1SGBZ: TStringField;
    ADOQuery1SGRQ: TDateTimeField;
    ADOQuery1BGRQ: TDateTimeField;
    ADOQuery1SGY: TStringField;
    ADOQuery1YQYSRQ: TDateTimeField;
    ADOQuery1DDHB: TDateTimeField;
    ADOQuery1GZNR: TMemoField;
    ADOQuery1BZZYSYJ: TStringField;
    ADOQuery1GCYSY_WB: TStringField;
    ADOQuery1GCYSY_SGFZ: TStringField;
    d: TStringField;
    ADOQuery1SGFZR: TStringField;
    ADOQuery1WBDBQZRQ: TDateTimeField;
    ADOQuery1SGFZRQZRQ: TDateTimeField;
    ADOQuery1YXYSYJ: TMemoField;
    ADOQuery1JSBCC: TStringField;
    ADOQuery1JSBYS: TStringField;
    ADOQuery1JSBYSRQ: TDateTimeField;
    ADOQuery1GCJGRQ: TDateTimeField;
    ADOQuery1BMJGQRR: TStringField;
    ADOQuery1BZ: TMemoField;
    ADOQuery1QRRQ: TDateTimeField;
    ADOQuery1DTDJ: TStringField;
    ADOQuery1DCDJ: TStringField;
    ADOQuery1GYGH: TStringField;
    ADOQuery1DYGH: TStringField;
    ADOQuery1GYCZR: TStringField;
    ADOQuery1DYCZR: TStringField;
    ADOQuery1XZCD_10: TStringField;
    ADOQuery1XZCD_38: TStringField;
    ADOQuery1XZCD_35: TStringField;
    ADOQuery1DHCD_10: TStringField;
    ADOQuery1DHCD_38: TStringField;
    ADOQuery1DHCD_35: TStringField;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBRichText1: TQRDBRichText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBRichText2: TQRDBRichText;
    QRDBRichText3: TQRDBRichText;
    sbcc: TQRLabel;
    pbdt: TQRLabel;
    dcdt: TQRLabel;
  private

  public

  end;

var
  Qrt_ysd: TQrt_ysd;

implementation

{$R *.DFM}

end.
