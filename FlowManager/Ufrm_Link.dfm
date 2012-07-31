object frm_Link: Tfrm_Link
  Left = 416
  Top = 211
  BorderStyle = bsDialog
  Caption = #27969#21521#23646#24615
  ClientHeight = 293
  ClientWidth = 329
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
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
    Top = 43
    Width = 68
    Height = 15
    Caption = #27969#21521#21517#31216':'
  end
  object RzLabel2: TRzLabel
    Left = 16
    Top = 83
    Width = 68
    Height = 15
    Caption = #27969#36716#26465#20214':'
  end
  object RzBorder1: TRzBorder
    Left = 7
    Top = 32
    Width = 311
    Height = 2
  end
  object RzLabel3: TRzLabel
    Left = 16
    Top = 8
    Width = 113
    Height = 15
    Caption = #35831#36755#20837#27969#21521#20449#24687':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    Transparent = True
    WordWrap = True
  end
  object RzDialogButtons1: TRzDialogButtons
    Left = 0
    Top = 257
    Width = 329
    CaptionOk = #30830#23450
    CaptionCancel = #21462#28040
    CaptionHelp = '&Help'
    ShowDivider = True
    ShowGlyphs = True
    OnClickOk = RzDialogButtons1ClickOk
    TabOrder = 0
  end
  object Diretip: TRzEdit
    Left = 96
    Top = 43
    Width = 201
    Height = 23
    TabOrder = 1
  end
  object RzRadioGroup1: TRzRadioGroup
    Left = 18
    Top = 190
    Width = 287
    Height = 57
    Caption = #27969#21521#31867#22411':'
    Columns = 3
    ItemFrameColor = 8409372
    ItemHotTrack = True
    ItemHighlightColor = 2203937
    ItemHotTrackColor = 3983359
    ItemHotTrackColorType = htctActual
    Items.Strings = (
      #20018' '#27969
      #36741' '#27969
      #24182' '#27969)
    SpaceEvenly = True
    TabOrder = 2
    ThemeAware = False
  end
  object condition: TRzMemo
    Left = 96
    Top = 83
    Width = 201
    Height = 97
    TabOrder = 3
  end
  object qry_Link: TADOQuery
    Connection = Dm_flow.Adc_flow
    CursorType = ctStatic
    BeforePost = qry_LinkBeforePost
    Parameters = <
      item
        Name = 'code'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 12
        Value = Null
      end>
    SQL.Strings = (
      'select * from FLOWDIRECTION'
      'where direcode =:code')
    Left = 32
    Top = 120
  end
end
