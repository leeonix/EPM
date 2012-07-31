object Fram_NewPrj: TFram_NewPrj
  Left = 0
  Top = 0
  Width = 559
  Height = 340
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = #23435#20307
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object Bevel4: TBevel
    Left = 5
    Top = 8
    Width = 544
    Height = 297
    Shape = bsFrame
  end
  object Bevel2: TBevel
    Left = 13
    Top = 150
    Width = 533
    Height = 3
  end
  object Label3: TLabel
    Left = 23
    Top = 23
    Width = 75
    Height = 15
    Caption = #24037#31243#24615#36136#65306
  end
  object Label4: TLabel
    Left = 23
    Top = 52
    Width = 75
    Height = 15
    Caption = #24037#31243#21517#31216#65306
  end
  object Label2: TLabel
    Left = 23
    Top = 80
    Width = 75
    Height = 15
    Caption = #24037#31243#24080#21495#65306
  end
  object Label5: TLabel
    Left = 309
    Top = 23
    Width = 90
    Height = 15
    Caption = #21463#29702#33829#19994#21592#65306
  end
  object Label6: TLabel
    Left = 23
    Top = 109
    Width = 75
    Height = 15
    Caption = #35774#35745#21333#20301#65306
  end
  object Label1: TLabel
    Left = 21
    Top = 191
    Width = 75
    Height = 15
    Caption = #25910#36153#26085#26399#65306
  end
  object Label7: TLabel
    Left = 21
    Top = 218
    Width = 75
    Height = 15
    Caption = #25910#36153#37329#39069#65306
  end
  object Label8: TLabel
    Left = 258
    Top = 192
    Width = 84
    Height = 15
    Caption = ' '#32852' '#31995' '#20154#65306
  end
  object Label9: TLabel
    Left = 267
    Top = 220
    Width = 75
    Height = 15
    Caption = #32852#31995#30005#35805#65306
  end
  object Label10: TLabel
    Left = 23
    Top = 246
    Width = 68
    Height = 15
    Caption = #30005#21387#31561#32423':'
  end
  object Label11: TLabel
    Left = 266
    Top = 248
    Width = 108
    Height = 15
    Caption = #35013#25509#23481#37327'(KVA):'
  end
  object Label13: TLabel
    Left = 23
    Top = 132
    Width = 75
    Height = 15
    Caption = #29992#25143#24773#20917#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel
    Left = 23
    Top = 163
    Width = 75
    Height = 15
    Caption = #24037#31243#22320#22336#65306
  end
  object PRJNAME: TEdit
    Left = 105
    Top = 48
    Width = 422
    Height = 23
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    TabOrder = 1
  end
  object cbb_prjtype: TComboBox
    Tag = 1
    Left = 104
    Top = 19
    Width = 145
    Height = 23
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 0
    Text = #19994#25193
    OnChange = cbb_prjtypeChange
    Items.Strings = (
      #19994#25193
      #19994#25193#37197#22871
      #20195#24037
      #24179#26041#31859
      #22522#24314
      #26356#25913)
  end
  object PRJACCOUNT: TEdit
    Left = 105
    Top = 76
    Width = 344
    Height = 23
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    TabOrder = 2
  end
  object DESIGNCOMPANY: TComboBox
    Left = 105
    Top = 105
    Width = 422
    Height = 23
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    TabOrder = 3
    OnEnter = DESIGNCOMPANYEnter
  end
  object yysfje: TEdit
    Left = 106
    Top = 215
    Width = 145
    Height = 23
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    TabOrder = 4
  end
  object lxr: TEdit
    Left = 375
    Top = 187
    Width = 153
    Height = 23
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    TabOrder = 5
  end
  object lxdh: TEdit
    Left = 375
    Top = 216
    Width = 153
    Height = 23
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    TabOrder = 6
  end
  object ZJRL: TEdit
    Left = 375
    Top = 244
    Width = 153
    Height = 23
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    TabOrder = 7
  end
  object DYDJ: TComboBox
    Left = 107
    Top = 244
    Width = 144
    Height = 23
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    TabOrder = 8
    Items.Strings = (
      '220/380V'
      '10KV'
      '35KV')
  end
  object yysfrq: TEdit
    Left = 107
    Top = 187
    Width = 144
    Height = 23
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    TabOrder = 9
    OnDblClick = yysfrqDblClick
  end
  object prjadd: TEdit
    Left = 106
    Top = 159
    Width = 422
    Height = 23
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    TabOrder = 10
  end
  object SLYYY: TEdit
    Left = 392
    Top = 18
    Width = 134
    Height = 23
    Enabled = False
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    TabOrder = 11
  end
  object parentcode: TEdit
    Left = 13
    Top = 311
    Width = 121
    Height = 23
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    TabOrder = 12
    Visible = False
  end
  object Corpcode: TEdit
    Left = 328
    Top = 311
    Width = 121
    Height = 23
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 13
    Visible = False
  end
  object btn_genprjacc: TButton
    Left = 451
    Top = 77
    Width = 29
    Height = 22
    Caption = '...'
    TabOrder = 14
    OnClick = btn_genprjaccClick
  end
  object path: TEdit
    Left = 107
    Top = 324
    Width = 121
    Height = 23
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 15
    Visible = False
  end
  object prjtype: TEdit
    Left = 159
    Top = 311
    Width = 153
    Height = 23
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    TabOrder = 16
    Visible = False
  end
end
