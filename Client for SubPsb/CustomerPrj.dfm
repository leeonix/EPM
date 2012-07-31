object Fram_CustmerPrj: TFram_CustmerPrj
  Left = 0
  Top = 0
  Width = 542
  Height = 371
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  TabStop = True
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 542
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label7: TLabel
      Left = 8
      Top = 6
      Width = 135
      Height = 14
      Caption = #29992#25143#20869#37096#24037#31243#24773#20917#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 4
      Top = 24
      Width = 532
      Height = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 336
    Width = 542
    Height = 35
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    object StaticText1: TStaticText
      Left = 8
      Top = 5
      Width = 513
      Height = 27
      AutoSize = False
      Caption = 
        #22914#26524#19994#25193#24037#31243#28041#21450#21040#29992#25143#20869#37096#24037#31243#65292#21017#30001#38598#22242#20844#21496#20998#20844#21496#24037#31243#37096#12289#24066#22330#37096#12289#29992#30005#30417#23519#23558#20869#37096#24037#31243#30340#36827#23637#31616#20917#36755#20837#65292#35745#21010#32463#33829#37096#35745#21010#21592#21487#20197#23454#26102#25484#25569 +
        #20869#37096#24037#31243#30340#23454#26045#24773#20917#12290
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 30
    Width = 542
    Height = 306
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 2
    object Bevel4: TBevel
      Left = 8
      Top = 8
      Width = 521
      Height = 98
      Shape = bsFrame
    end
    object Bevel3: TBevel
      Left = 8
      Top = 206
      Width = 521
      Height = 95
      Shape = bsFrame
    end
    object Bevel2: TBevel
      Left = 8
      Top = 117
      Width = 521
      Height = 73
      Shape = bsFrame
    end
    object Label1: TLabel
      Left = 16
      Top = 81
      Width = 70
      Height = 14
      Caption = #25910#36153#26085#26399#65306
    end
    object Label2: TLabel
      Left = 19
      Top = 159
      Width = 70
      Height = 14
      Caption = #23454#38469#24320#24037#65306
    end
    object Label3: TLabel
      Left = 19
      Top = 129
      Width = 70
      Height = 14
      Caption = #35745#21010#24320#24037#65306
    end
    object Label4: TLabel
      Left = 243
      Top = 129
      Width = 70
      Height = 14
      Caption = #35745#21010#31459#24037#65306
    end
    object Label5: TLabel
      Left = 16
      Top = 222
      Width = 91
      Height = 14
      Caption = #35745#21010#22303#24314#39564#25910':'
    end
    object Label6: TLabel
      Left = 16
      Top = 272
      Width = 70
      Height = 14
      Caption = #30417#23519#22995#21517#65306
    end
    object Label8: TLabel
      Left = 16
      Top = 26
      Width = 70
      Height = 14
      Caption = #24037#31243#21517#31216#65306
    end
    object Label9: TLabel
      Left = 14
      Top = 52
      Width = 70
      Height = 14
      Caption = #24037#31243#24080#21495#65306
    end
    object Label10: TLabel
      Left = 24
      Top = 109
      Width = 77
      Height = 14
      Caption = #24320#31459#24037#24773#20917':'
    end
    object Label11: TLabel
      Left = 243
      Top = 159
      Width = 70
      Height = 14
      Caption = #23454#38469#31459#24037#65306
    end
    object Label12: TLabel
      Left = 24
      Top = 198
      Width = 63
      Height = 14
      Caption = #39564#25910#26085#26399':'
    end
    object Label13: TLabel
      Left = 16
      Top = 246
      Width = 91
      Height = 14
      Caption = #23454#38469#22303#24314#39564#25910':'
    end
    object Label14: TLabel
      Left = 256
      Top = 222
      Width = 91
      Height = 14
      Caption = #35745#21010#24037#31243#39564#25910':'
    end
    object Label15: TLabel
      Left = 256
      Top = 246
      Width = 91
      Height = 14
      Caption = #23454#38469#24037#31243#39564#25910':'
    end
    object Label16: TLabel
      Left = 24
      Top = 5
      Width = 63
      Height = 14
      Caption = #24037#31243#24773#20917':'
    end
    object CUSTOMERNAME: TEdit
      Left = 88
      Top = 22
      Width = 401
      Height = 22
      Enabled = False
      ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
      ReadOnly = True
      TabOrder = 0
    end
    object PAYFEEDATE: TEdit
      Left = 88
      Top = 77
      Width = 137
      Height = 22
      Enabled = False
      ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
      TabOrder = 1
      OnDblClick = JHStartDblClick
    end
    object STARTDATE: TEdit
      Left = 87
      Top = 155
      Width = 135
      Height = 22
      Enabled = False
      ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
      TabOrder = 2
      OnDblClick = JHStartDblClick
    end
    object PRJACCOUNT: TEdit
      Left = 88
      Top = 48
      Width = 329
      Height = 22
      Enabled = False
      ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
      TabOrder = 3
    end
    object JHStart: TEdit
      Left = 87
      Top = 125
      Width = 135
      Height = 22
      Enabled = False
      ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
      TabOrder = 4
      OnDblClick = JHStartDblClick
    end
    object FINISHDATE: TEdit
      Left = 320
      Top = 155
      Width = 142
      Height = 22
      Enabled = False
      ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
      TabOrder = 5
      OnDblClick = JHStartDblClick
    end
    object jhtujdate: TEdit
      Left = 112
      Top = 220
      Width = 131
      Height = 22
      Enabled = False
      ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
      TabOrder = 6
      OnDblClick = JHStartDblClick
    end
    object Jhfinish: TEdit
      Left = 320
      Top = 125
      Width = 142
      Height = 22
      Enabled = False
      ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
      TabOrder = 7
      OnDblClick = JHStartDblClick
    end
    object tujdate: TEdit
      Left = 112
      Top = 244
      Width = 131
      Height = 22
      Enabled = False
      ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
      TabOrder = 8
      OnDblClick = JHStartDblClick
    end
    object jhcheck: TEdit
      Left = 352
      Top = 220
      Width = 128
      Height = 22
      Enabled = False
      ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
      TabOrder = 9
      OnDblClick = JHStartDblClick
    end
    object CHECKDATE: TEdit
      Left = 352
      Top = 244
      Width = 128
      Height = 22
      Enabled = False
      ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
      TabOrder = 10
      OnDblClick = JHStartDblClick
    end
    object Fyyfq: TCheckBox
      Left = 264
      Top = 80
      Width = 97
      Height = 17
      Caption = #36153#29992#24050#32467#28165
      Enabled = False
      TabOrder = 11
    end
    object SUPERVISION: TComboBox
      Left = 112
      Top = 272
      Width = 137
      Height = 22
      Enabled = False
      ItemHeight = 14
      TabOrder = 12
      OnEnter = SUPERVISIONEnter
    end
  end
end
