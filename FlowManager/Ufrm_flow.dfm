object frm_flow: Tfrm_flow
  Left = 343
  Top = 166
  BorderStyle = bsDialog
  Caption = #19994#21153#27969#31243
  ClientHeight = 337
  ClientWidth = 370
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object RzLabel1: TRzLabel
    Left = 16
    Top = 52
    Width = 68
    Height = 15
    Caption = #27969#31243#21517#31216':'
  end
  object RzBorder1: TRzBorder
    Left = 8
    Top = 32
    Width = 351
    Height = 2
  end
  object RzLabel2: TRzLabel
    Left = 16
    Top = 8
    Width = 188
    Height = 15
    Caption = #35831#36755#20837#23436#25972#30340#19994#21153#27969#31243#20449#24687':'
  end
  object RzLabel3: TRzLabel
    Left = 16
    Top = 92
    Width = 69
    Height = 15
    Caption = #21019' '#24314' '#32773':'
  end
  object RzLabel4: TRzLabel
    Left = 16
    Top = 132
    Width = 68
    Height = 15
    Caption = #21019#24314#26085#26399':'
    Rotation = roFlat
  end
  object RzLabel5: TRzLabel
    Left = 16
    Top = 172
    Width = 68
    Height = 15
    Caption = #31616#35201#25551#36848':'
    LightTextStyle = True
    Rotation = roFlat
  end
  object RzDialogButtons1: TRzDialogButtons
    Left = 0
    Top = 301
    Width = 370
    ButtonColor = 15791348
    CaptionOk = #30830#23450
    CaptionCancel = #21462#28040
    CaptionHelp = '&Help'
    HighlightColor = 16026986
    HotTrackColor = 3983359
    HotTrackColorType = htctActual
    ShowDivider = True
    ShowGlyphs = True
    OnClickOk = RzDialogButtons1ClickOk
    TabOrder = 0
  end
  object RzDe_flowname: TRzDBEdit
    Left = 88
    Top = 48
    Width = 241
    Height = 23
    DataSource = DataSource1
    DataField = 'flowname'
    TabOrder = 1
  end
  object RzDBEdit2: TRzDBEdit
    Left = 88
    Top = 88
    Width = 241
    Height = 23
    DataSource = DataSource1
    DataField = 'maintainby'
    TabOrder = 2
  end
  object RzDBDateTimeEdit1: TRzDBDateTimeEdit
    Left = 88
    Top = 128
    Width = 241
    Height = 23
    DataSource = DataSource1
    DataField = 'createdate'
    TabOrder = 3
    EditType = etDate
  end
  object RzDBMemo1: TRzDBMemo
    Left = 88
    Top = 168
    Width = 241
    Height = 89
    DataField = 'description'
    DataSource = DataSource1
    TabOrder = 4
  end
  object ADOQuery1: TADOQuery
    Connection = Dm_flow.Adc_flow
    BeforePost = ADOQuery1BeforePost
    Parameters = <
      item
        Name = 'code'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      'select flowcode,flowname,maintainby,description,createdate'
      'from flow '
      'where flowcode=:code')
    Left = 48
    Top = 248
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 24
    Top = 200
  end
end
