object Fram_descontract: TFram_descontract
  Left = 0
  Top = 0
  Width = 594
  Height = 513
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  TabStop = True
  object Bevel1: TBevel
    Left = 15
    Top = 14
    Width = 570
    Height = 457
    Shape = bsFrame
  end
  object Label14: TLabel
    Left = 24
    Top = 347
    Width = 91
    Height = 14
    Caption = #24037#31243#39033#30446#35268#27169':'
  end
  object Bevel3: TBevel
    Left = 24
    Top = 340
    Width = 545
    Height = 3
  end
  object Label19: TLabel
    Left = 15
    Top = 4
    Width = 105
    Height = 14
    Caption = #24037#31243#35774#35745#21512#21516#65306
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel2: TBevel
    Left = 28
    Top = 185
    Width = 545
    Height = 3
  end
  object Label3: TLabel
    Left = 33
    Top = 166
    Width = 147
    Height = 14
    Caption = #24037#31243#20998#36134#21495#35774#35745#36153#26126#32454':'
  end
  object RzGroupBox5: TRzGroupBox
    Left = 28
    Top = 35
    Width = 533
    Height = 118
    Caption = #35774#35745#21512#21516
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 21
      Width = 63
      Height = 14
      Caption = #35774#35745#21333#20301':'
    end
    object Label2: TLabel
      Left = 8
      Top = 52
      Width = 91
      Height = 14
      Caption = #21512#21516#31614#35746#26085#26399':'
    end
    object Label4: TLabel
      Left = 8
      Top = 85
      Width = 63
      Height = 14
      Caption = #21512#21516#32534#21495':'
    end
    object stdw: TComboBox
      Left = 105
      Top = 18
      Width = 223
      Height = 22
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      Items.Strings = (
        #19978#28023#33559#24029#27979#32472#25216#26415#26377#38480#20844#21496)
    end
    object htbh: TEdit
      Left = 105
      Top = 79
      Width = 192
      Height = 22
      Enabled = False
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 1
    end
    object qdrq: TDateTimePicker
      Left = 105
      Top = 51
      Width = 192
      Height = 22
      Date = 41100.496904930560000000
      Time = 41100.496904930560000000
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 2
    end
    object htje: TEdit
      Left = 313
      Top = 79
      Width = 120
      Height = 22
      Enabled = False
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 3
      Visible = False
    end
  end
  object gcnr: TRichEdit
    Left = 24
    Top = 365
    Width = 537
    Height = 99
    ImeName = #32043#20809#21326#23431#25340#38899'V5'
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object DBGrid2: TDBGrid
    Left = 28
    Top = 196
    Width = 545
    Height = 133
    DataSource = DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 376
    Top = 480
    Width = 65
    Height = 30
    Caption = #20445#23384
    Enabled = False
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 480
    Top = 480
    Width = 105
    Height = 30
    Caption = #25171#21360#21512#21516'...'
    Enabled = False
    TabOrder = 4
    OnClick = Button2Click
  end
  object prjname: TEdit
    Left = 113
    Top = 477
    Width = 120
    Height = 22
    Enabled = False
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 5
    Visible = False
  end
  object prjtype: TEdit
    Left = 239
    Top = 477
    Width = 120
    Height = 22
    Enabled = False
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 6
    Visible = False
  end
  object ADOQuery1: TADOQuery
    Connection = Dm_Epm.cn_epm
    CursorType = ctStatic
    Parameters = <>
    Left = 504
    Top = 160
    object ADOQuery1PRJACCOUNT: TStringField
      DisplayLabel = #24037#31243#20998#36134#21495
      DisplayWidth = 17
      FieldName = 'PRJACCOUNT'
      Size = 40
    end
    object ADOQuery1PRJNAME: TStringField
      DisplayLabel = #24037#31243#21517#31216
      DisplayWidth = 43
      FieldName = 'PRJNAME'
      Size = 60
    end
    object ADOQuery1Sjf: TStringField
      DisplayLabel = #35774#35745#36153
      DisplayWidth = 10
      FieldName = 'Sjf'
      Size = 10
    end
    object ADOQuery1sumfee: TStringField
      DisplayLabel = #39044#31639#24635#36153#29992
      FieldName = 'sumfee'
      Size = 10
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 472
    Top = 160
  end
  object MyReport1: TMyReport
    Reporttitle = #19978#28023#26216#36745#31185#25216'Excel'#36755#20986
    prefixchar = '@'
    reporttype = rtcard
    Left = 488
    Top = 72
  end
end
