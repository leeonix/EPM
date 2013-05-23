object Frm_Contract: TFrm_Contract
  Left = 347
  Top = 178
  BorderStyle = bsSingle
  Caption = #21512#21516#24405#20837
  ClientHeight = 485
  ClientWidth = 743
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  Scaled = False
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 14
  object RzGroupBox2: TRzGroupBox
    Left = 8
    Top = 8
    Width = 366
    Height = 329
    Caption = #26045#24037#21512#21516
    TabOrder = 13
    object Label9: TLabel
      Left = 24
      Top = 32
      Width = 77
      Height = 14
      Caption = #26045#24037#25215#21253#21830':'
    end
    object Label3: TLabel
      Left = 24
      Top = 64
      Width = 91
      Height = 14
      Caption = #35745#21010#24320#24037#26085#26399':'
    end
    object Label16: TLabel
      Left = 24
      Top = 96
      Width = 91
      Height = 14
      Caption = #35745#21010#31459#24037#26085#26399':'
    end
    object Label17: TLabel
      Left = 24
      Top = 128
      Width = 91
      Height = 14
      Caption = #21512#21516#31614#35746#26085#26399':'
    end
    object Label18: TLabel
      Left = 24
      Top = 167
      Width = 63
      Height = 14
      Caption = #21512#21516#37329#39069':'
    end
    object Label19: TLabel
      Left = 24
      Top = 201
      Width = 77
      Height = 14
      Caption = #25991#26126#25514#26045#36153':'
    end
    object Label20: TLabel
      Left = 24
      Top = 227
      Width = 49
      Height = 14
      Caption = #39044#20184#27454':'
    end
    object lbljffzr: TLabel
      Left = 24
      Top = 259
      Width = 77
      Height = 14
      Caption = #30002#26041#36127#36131#20154':'
    end
    object Label5: TLabel
      Left = 21
      Top = 297
      Width = 91
      Height = 14
      Caption = #26045#24037#21512#21516#32534#21495':'
    end
    object sghtbh: TEdit
      Left = 130
      Top = 289
      Width = 167
      Height = 22
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 0
      TextHint = #35831#22635#20837#32463#27861#31995#32479#20013#26045#24037#21512#21516#32534#21495
    end
  end
  object Button1: TButton
    Left = 421
    Top = 431
    Width = 72
    Height = 30
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 517
    Top = 431
    Width = 73
    Height = 30
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
  object RzGroupBox1: TRzGroupBox
    Left = 8
    Top = 375
    Width = 377
    Height = 74
    Caption = #24310#26399#21512#21516
    TabOrder = 7
    Visible = False
    object Label10: TLabel
      Left = 7
      Top = 36
      Width = 91
      Height = 14
      Caption = #35745#21010#24320#24037' '#33258#65306
    end
    object Label11: TLabel
      Left = 228
      Top = 36
      Width = 28
      Height = 14
      Caption = #33267#65306
    end
    object delaystart: TRzDateTimeEdit
      Left = 104
      Top = 28
      Width = 118
      Height = 22
      EditType = etDate
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 0
    end
    object delayend: TRzDateTimeEdit
      Left = 249
      Top = 28
      Width = 117
      Height = 22
      EditType = etDate
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 1
    end
  end
  object RzCheckBox1: TRzCheckBox
    Left = 8
    Top = 353
    Width = 75
    Height = 16
    Caption = #26159#21542#24310#26399
    State = cbUnchecked
    TabOrder = 8
    OnClick = RzCheckBox1Click
  end
  object RzGroupBox3: TRzGroupBox
    Left = 397
    Top = 8
    Width = 340
    Height = 146
    Caption = #30417#29702#21512#21516
    TabOrder = 10
    object Label2: TLabel
      Left = 24
      Top = 33
      Width = 63
      Height = 14
      Caption = #30417#29702#21333#20301':'
    end
    object Label8: TLabel
      Left = 24
      Top = 71
      Width = 49
      Height = 14
      Caption = #30417#29702#36153':'
    end
    object Label1: TLabel
      Left = 0
      Top = 104
      Width = 91
      Height = 14
      Caption = #30417#29702#21512#21516#32534#21495':'
    end
    object Jldw: TComboBox
      Left = 93
      Top = 30
      Width = 223
      Height = 22
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      Items.Strings = (
        '')
    end
    object jlf: TEdit
      Left = 93
      Top = 68
      Width = 225
      Height = 22
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 1
    end
    object jlhtbh: TEdit
      Left = 93
      Top = 101
      Width = 225
      Height = 22
      TabOrder = 2
      TextHint = #35831#36755#20837#32463#27861#31995#32479#20013#33719#21462#30340#35813#21512#21516#32534#21495
    end
  end
  object RzGroupBox4: TRzGroupBox
    Left = 397
    Top = 183
    Width = 338
    Height = 154
    Caption = #27979#32472#21512#21516
    TabOrder = 11
    object Label14: TLabel
      Left = 24
      Top = 33
      Width = 63
      Height = 14
      Caption = #27979#32472#21333#20301':'
    end
    object Label15: TLabel
      Left = 24
      Top = 71
      Width = 49
      Height = 14
      Caption = #27979#32472#36153':'
    end
    object Label4: TLabel
      Left = 24
      Top = 107
      Width = 91
      Height = 14
      Caption = #27979#32472#21512#21516#32534#21495':'
    end
    object chdw: TComboBox
      Left = 93
      Top = 30
      Width = 223
      Height = 22
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
    end
    object chf: TEdit
      Left = 93
      Top = 68
      Width = 225
      Height = 22
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 1
    end
    object chhtbh: TEdit
      Left = 93
      Top = 104
      Width = 225
      Height = 22
      TabOrder = 2
      TextHint = #35831#22635#20837#32463#27861#31995#32479#20013#27979#32472#21512#21516#32534#21495
    end
  end
  object Et_jhkgrq: TEdit
    Left = 138
    Top = 76
    Width = 126
    Height = 22
    Hint = #21452#20987#21487#20197#36873#25321#26085#21382
    Enabled = False
    ImeName = #37329#23665#33521#25991#20889#20316#21161#25163
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object edt_prepayment: TEdit
    Left = 138
    Top = 238
    Width = 126
    Height = 22
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 9
  end
  object edt_jlf: TEdit
    Left = 138
    Top = 210
    Width = 126
    Height = 22
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 6
  end
  object edt_htje: TEdit
    Left = 138
    Top = 176
    Width = 126
    Height = 22
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 5
  end
  object Et_jhjgrq: TEdit
    Left = 138
    Top = 109
    Width = 126
    Height = 22
    Hint = #21452#20987#21487#20197#36873#25321#26085#21382
    Enabled = False
    ImeName = #37329#23665#33521#25991#20889#20316#21161#25163
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object cb_sgdw: TComboBox
    Left = 138
    Top = 41
    Width = 223
    Height = 22
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
  end
  object printdate: TRzDateTimeEdit
    Left = 138
    Top = 137
    Width = 126
    Height = 22
    EditType = etDate
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 12
  end
  object cbb_jffzr: TComboBox
    Left = 138
    Top = 266
    Width = 126
    Height = 22
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ParentShowHint = False
    ShowHint = False
    TabOrder = 14
    Items.Strings = (
      #24352#23792
      #29579#28165#25196)
  end
  object btn_setparam: TRzButton
    Left = 265
    Top = 266
    Width = 31
    Caption = '...'
    TabOrder = 15
    OnClick = btn_setparamClick
  end
end
