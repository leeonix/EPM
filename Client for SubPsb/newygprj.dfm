object Fram_NewygPrj: TFram_NewygPrj
  Left = 0
  Top = 0
  Width = 543
  Height = 358
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = #23435#20307
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object Bevel1: TBevel
    Left = 8
    Top = 7
    Width = 505
    Height = 314
    Shape = bsFrame
  end
  object Label3: TLabel
    Left = 16
    Top = 22
    Width = 75
    Height = 15
    Caption = #24037#31243#24615#36136#65306
  end
  object Label4: TLabel
    Left = 16
    Top = 54
    Width = 75
    Height = 15
    Caption = #24037#31243#21517#31216#65306
  end
  object Label2: TLabel
    Left = 16
    Top = 190
    Width = 75
    Height = 15
    Caption = #24037#31243#24080#21495#65306
  end
  object Label5: TLabel
    Left = 272
    Top = 22
    Width = 75
    Height = 15
    Caption = #24037#31243#31867#21035#65306
  end
  object Label6: TLabel
    Left = 16
    Top = 124
    Width = 75
    Height = 15
    Caption = #35774#35745#21333#20301#65306
  end
  object Label1: TLabel
    Left = 16
    Top = 225
    Width = 75
    Height = 15
    Caption = #30003#35831#26085#26399#65306
  end
  object Label7: TLabel
    Left = 264
    Top = 225
    Width = 75
    Height = 15
    Caption = #25209#22797#26085#26399#65306
  end
  object Label12: TLabel
    Left = 16
    Top = 88
    Width = 75
    Height = 15
    Caption = #24037#31243#22320#22336#65306
  end
  object Bevel3: TBevel
    Left = 96
    Top = 159
    Width = 400
    Height = 9
    Shape = bsBottomLine
  end
  object Label8: TLabel
    Left = 14
    Top = 159
    Width = 68
    Height = 15
    Caption = #29992#25913#30003#35831':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 12
    Top = 257
    Width = 143
    Height = 15
    Caption = ' '#25152#23646#19994#25193#24037#31243#24773#20917#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 24
    Top = 288
    Width = 75
    Height = 15
    Caption = #24037#31243#24080#21495#65306
  end
  object SpeedButton1: TSpeedButton
    Left = 421
    Top = 281
    Width = 69
    Height = 23
    Caption = #35814#32454#24773#20917'...'
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButton1Click
  end
  object Bevel2: TBevel
    Left = 145
    Top = 258
    Width = 353
    Height = 9
    Shape = bsBottomLine
  end
  object PRJTYPE: TComboBox
    Left = 98
    Top = 18
    Width = 145
    Height = 23
    Enabled = False
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    ItemHeight = 15
    TabOrder = 0
    Text = #29992#25913'('#19994#25193')'
    Items.Strings = (
      #29992#25913'('#19994#25193')')
  end
  object PRJNAME: TEdit
    Left = 98
    Top = 50
    Width = 391
    Height = 23
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    TabOrder = 2
  end
  object PRJACCOUNT: TEdit
    Left = 98
    Top = 186
    Width = 223
    Height = 23
    TabOrder = 3
  end
  object OTHERTYPE: TComboBox
    Left = 355
    Top = 18
    Width = 133
    Height = 23
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    ItemHeight = 15
    TabOrder = 1
    Items.Strings = (
      #24066#25919#37325#28857#24037#31243
      #36814#23792#28193#22799)
  end
  object DESIGNCOMPANY: TComboBox
    Left = 98
    Top = 120
    Width = 391
    Height = 23
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    ItemHeight = 15
    TabOrder = 5
    OnEnter = DESIGNCOMPANYEnter
  end
  object ygzhpfrq: TEdit
    Left = 346
    Top = 221
    Width = 142
    Height = 23
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    TabOrder = 6
    OnDblClick = ygsqrqDblClick
  end
  object ygsqrq: TEdit
    Left = 98
    Top = 221
    Width = 142
    Height = 23
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    TabOrder = 7
    OnDblClick = ygsqrqDblClick
  end
  object prjadd: TEdit
    Left = 98
    Top = 84
    Width = 391
    Height = 23
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    TabOrder = 4
  end
  object parentcode: TEdit
    Left = 216
    Top = 328
    Width = 121
    Height = 23
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    TabOrder = 8
    Text = 'parentcode'
    Visible = False
  end
  object parentprjacc: TEdit
    Tag = 1
    Left = 98
    Top = 282
    Width = 317
    Height = 23
    Enabled = False
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    TabOrder = 9
  end
  object corpcode: TEdit
    Left = 360
    Top = 328
    Width = 121
    Height = 23
    TabOrder = 10
    Text = 'corpcode'
    Visible = False
  end
end
