object Frm_Selectcontract: TFrm_Selectcontract
  Left = 405
  Top = 222
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #36873#25321#25171#21360#25991#20214
  ClientHeight = 299
  ClientWidth = 453
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  object BitBtn1: TBitBtn
    Left = 198
    Top = 247
    Width = 70
    Height = 28
    Caption = #30830#23450
    Default = True
    DoubleBuffered = True
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 339
    Top = 247
    Width = 70
    Height = 28
    Caption = #21462#28040
    DoubleBuffered = True
    Kind = bkCancel
    ParentDoubleBuffered = False
    TabOrder = 1
  end
  object RzCheckGroup1: TRzCheckGroup
    Left = 8
    Top = 8
    Width = 177
    Height = 233
    Caption = #35831#36873#25321#35201#25171#21360#30340#21512#21516
    ItemHeight = 29
    Items.Strings = (
      #26045#24037#21512#21516
      #24310#26399#21512#21516
      #23433#20840#31649#29702#21327#35758
      #24265#27905#21327#35758'('#26045#24037')'
      #27979#32472#21512#21516
      #30417#29702#21512#21516
      #24265#27905#21327#35758'('#30417#29702')')
    TabOrder = 2
    CheckStates = (
      0
      0
      0
      0
      0
      0
      0)
  end
  object rzchckgrpoldcontract: TRzCheckGroup
    Left = 621
    Top = 8
    Width = 209
    Height = 177
    Caption = '2011'#26045#24037#21512#21516#29256#26412
    ItemHeight = 29
    Items.Strings = (
      #26045#24037#21512#21516
      #26045#24037#21512#21516'('#39044#20184#27454')'
      #26045#24037#21512#21516'('#24418#35937#36827#24230')')
    TabOrder = 3
    Visible = False
    CheckStates = (
      0
      0
      0)
  end
  object RzRadioGroup1: TRzRadioGroup
    Left = 198
    Top = 8
    Width = 227
    Height = 50
    Margins.Left = 10
    Margins.Top = 10
    Caption = #35831#36873#25321#26045#24037#21512#21516#25215#21253#26041#24335
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #24635#25215#21253#21512#21516
      #19987#19994#25215#21253#21512#21516)
    TabOrder = 4
    VerticalSpacing = 5
  end
  object RzRadioGroup2: TRzRadioGroup
    Left = 198
    Top = 71
    Width = 227
    Height = 50
    Margins.Left = 10
    Margins.Top = 10
    Caption = #26045#24037#26159#21542#25307#25237#26631
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #38750#25307#26631#21512#21516
      #25307#26631#21512#21516)
    TabOrder = 5
    VerticalSpacing = 5
  end
  object RzRadioGroup3: TRzRadioGroup
    Left = 198
    Top = 128
    Width = 227
    Height = 50
    Margins.Left = 10
    Margins.Top = 10
    Caption = #21512#21516#29256#26412
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #22269#32593#29256#26412
      #24066#21335'2012'#29256#26412)
    TabOrder = 6
    VerticalSpacing = 5
  end
  object RzRadioGroup4: TRzRadioGroup
    Left = 198
    Top = 191
    Width = 227
    Height = 50
    Margins.Left = 10
    Margins.Top = 10
    Caption = #39044#20184#27454#26041#24335
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #26080#39044#20184#27454
      #39044#20184#27454#21512#21516)
    TabOrder = 7
    VerticalSpacing = 5
  end
  object MyReport1: TMyReport
    Reporttitle = 'Excel'#36755#20986
    prefixchar = '@'
    reporttype = rtcard
    Left = 390
    Top = 250
  end
end
