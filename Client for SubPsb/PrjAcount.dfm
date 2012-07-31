object frm_GenPrjacc: Tfrm_GenPrjacc
  Left = 271
  Top = 199
  BorderStyle = bsSingle
  Caption = #24037#31243#24080#21495#31867#22411
  ClientHeight = 123
  ClientWidth = 467
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 24
    Top = 56
    Width = 70
    Height = 14
    Caption = #24037#31243#24080#21495#65306
  end
  object Label3: TLabel
    Left = 341
    Top = 56
    Width = 7
    Height = 14
    Caption = '-'
  end
  object lbl_prifix: TLabel
    Left = 160
    Top = 56
    Width = 63
    Height = 14
    Alignment = taRightJustify
    Caption = #38389#19994'2004-'
  end
  object Label2: TLabel
    Left = 24
    Top = 21
    Width = 70
    Height = 14
    Caption = #24037#31243#24180#24230#65306
  end
  object pnl_yk: TPanel
    Left = 8
    Top = 88
    Width = 289
    Height = 153
    Caption = 'Pnl_yk'
    TabOrder = 3
    Visible = False
    object RadioGroup1: TRadioGroup
      Left = 88
      Top = 8
      Width = 193
      Height = 105
      Caption = #29992#25143#31867#22411#65306
      Items.Strings = (
        'A:'#19968#33324#29992#25143
        'B:'#31038#38431#29992#25143#65288#20892#26449#65289
        'C:'#22522#24314#29992#25143#65288#22522#24314#29992#30005#65289)
      TabOrder = 0
    end
    object RadioGroup2: TRadioGroup
      Left = 8
      Top = 8
      Width = 73
      Height = 105
      Caption = #29992#30005#37327#65306
      Items.Strings = (
        #22823#37327
        #23567#37327)
      TabOrder = 1
    end
    object BitBtn3: TBitBtn
      Left = 96
      Top = 120
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 2
      OnClick = BitBtn3Click
      Kind = bkOK
    end
    object BitBtn4: TBitBtn
      Left = 184
      Top = 120
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 3
      OnClick = BitBtn4Click
      Kind = bkCancel
    end
  end
  object BitBtn1: TBitBtn
    Left = 224
    Top = 80
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 304
    Top = 80
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 1
  end
  object cxPopupEdit1: TcxPopupEdit
    Left = 224
    Top = 52
    TabOrder = 2
    Width = 113
  end
  object cxMaskEdit1: TcxMaskEdit
    Left = 352
    Top = 52
    Properties.EditMask = '000;1;_'
    Properties.MaxLength = 0
    TabOrder = 4
    Text = '   '
    Width = 65
  end
  object pnl_yg: TPanel
    Left = 8
    Top = 224
    Width = 225
    Height = 137
    TabOrder = 5
    Visible = False
    object RadioGroup3: TRadioGroup
      Left = 8
      Top = 8
      Width = 201
      Height = 81
      Caption = #29992#25913#24037#31243#24615#36136#65306
      Items.Strings = (
        #29992#25913#65288#24066#21335#65289#65288#36164#37329'>5'#19975#65289
        #29992#25913#65288#38389#65289'  '#65288#36164#37329'<5'#19975#65289)
      TabOrder = 0
    end
    object BitBtn5: TBitBtn
      Left = 134
      Top = 104
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = BitBtn4Click
      Kind = bkCancel
    end
    object BitBtn6: TBitBtn
      Left = 48
      Top = 104
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 2
      OnClick = BitBtn6Click
      Kind = bkOK
    end
  end
  object pnl_ld: TPanel
    Left = 240
    Top = 224
    Width = 217
    Height = 129
    TabOrder = 6
    Visible = False
    object RadioGroup4: TRadioGroup
      Left = 8
      Top = 8
      Width = 193
      Height = 81
      Caption = #36335#28783#24037#31243#31867#21035#65306
      Items.Strings = (
        #38389#24066#36335#65288#26032#35013#24066#25919#36335#28783#65289
        #38389#36335#20195#65288#24066#25919#36335#28783#25644#36801#65289)
      TabOrder = 0
    end
    object BitBtn7: TBitBtn
      Left = 134
      Top = 96
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = BitBtn4Click
      Kind = bkCancel
    end
    object BitBtn8: TBitBtn
      Left = 48
      Top = 96
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 2
      OnClick = BitBtn8Click
      Kind = bkOK
    end
  end
  inline fram_subprjacc1: Tfram_subprjacc
    Left = 91
    Top = 360
    Width = 430
    Height = 113
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    TabStop = True
    Visible = False
    ExplicitLeft = 91
    ExplicitTop = 360
    ExplicitWidth = 430
    ExplicitHeight = 113
    inherited cxPopupEdit1: TcxPopupEdit
      ExplicitHeight = 22
    end
    inherited cxMaskEdit1: TcxMaskEdit
      ExplicitHeight = 22
    end
    inherited BitBtn1: TBitBtn
      OnClick = fram_subprjacc1BitBtn1Click
    end
    inherited BitBtn2: TBitBtn
      OnClick = fram_subprjacc1BitBtn2Click
    end
  end
  object cxComboBox1: TcxComboBox
    Left = 106
    Top = 18
    Properties.Items.Strings = (
      '2003'
      '2004')
    Properties.OnChange = cxComboBox1PropertiesChange
    TabOrder = 8
    Width = 119
  end
end
