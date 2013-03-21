object frm_contractlist: Tfrm_contractlist
  Left = 0
  Top = 0
  Caption = #21512#21516#31614#35746#28165#21333#26597#35810#32479#35745
  ClientHeight = 203
  ClientWidth = 508
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object Label10: TLabel
    Left = 7
    Top = 36
    Width = 125
    Height = 18
    Caption = #21512#21516#31614#35746#26085#26399' '#33258#65306
  end
  object Label11: TLabel
    Left = 268
    Top = 36
    Width = 30
    Height = 18
    Caption = #33267#65306
  end
  object startdate: TRzDateTimeEdit
    Left = 144
    Top = 28
    Width = 118
    Height = 26
    EditType = etDate
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 0
  end
  object enddate: TRzDateTimeEdit
    Left = 304
    Top = 28
    Width = 117
    Height = 26
    EditType = etDate
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 1
  end
  object BitBtn2: TBitBtn
    Left = 399
    Top = 167
    Width = 70
    Height = 28
    Caption = #36864#20986
    DoubleBuffered = True
    Kind = bkCancel
    ParentDoubleBuffered = False
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 268
    Top = 167
    Width = 125
    Height = 28
    Caption = #23548#20986#21040'excel'
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
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object RzCheckGroup1: TRzCheckGroup
    Left = 8
    Top = 82
    Width = 413
    Height = 55
    Caption = #35831#36873#25321#35201#32479#35745#30340#21512#21516#31867#21035
    Columns = 4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    Items.Strings = (
      #26045#24037#21512#21516'       '
      #27979#32472#21512#21516'  '
      #30417#29702#21512#21516'  '
      #35774#35745#21512#21516'  ')
    ParentFont = False
    TabOrder = 4
    CheckStates = (
      0
      0
      0
      0)
  end
  object excelrep: TMyReport
    Reporttitle = #19978#28023#26216#36745#31185#25216'Excel'#36755#20986
    Col = 2
    prefixchar = '@'
    reporttype = rtreport
    dataset = ADOQuery1
    Left = 440
    Top = 96
  end
  object ADOQuery1: TADOQuery
    Connection = Dm_Epm.cn_epm
    CursorType = ctStatic
    Parameters = <>
    Left = 464
    Top = 48
  end
end
