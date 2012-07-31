object fram_subprjacc: Tfram_subprjacc
  Left = 0
  Top = 0
  Width = 515
  Height = 492
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  TabStop = True
  object lbl_prifix: TLabel
    Left = 221
    Top = 44
    Width = 63
    Height = 14
    Alignment = taRightJustify
    Caption = #38389#19994'2004-'
  end
  object lbl_dash: TLabel
    Left = 285
    Top = 44
    Width = 7
    Height = 14
    Caption = '-'
    Visible = False
  end
  object Label1: TLabel
    Left = 136
    Top = 10
    Width = 84
    Height = 14
    Caption = #23376#24037#31243#24080#21495#65306
  end
  object cxPopupEdit1: TcxPopupEdit
    Left = 328
    Top = 40
    TabOrder = 0
    Visible = False
    Width = 97
  end
  object RadioGroup1: TRadioGroup
    Left = 6
    Top = 8
    Width = 115
    Height = 73
    Caption = #23376#24037#31243#31867#22411
    Items.Strings = (
      #25353#29031#19987#19994#31867#22411
      #25353#23454#26045#33539#22260)
    TabOrder = 1
    OnClick = RadioGroup1Click
  end
  object cxMaskEdit1: TcxMaskEdit
    Left = 296
    Top = 40
    Properties.EditMask = '00;1;_'
    Properties.MaxLength = 0
    TabOrder = 2
    Text = '  '
    Visible = False
    Width = 33
  end
  object Panel1: TPanel
    Left = 8
    Top = 88
    Width = 321
    Height = 393
    Caption = 'Panel1'
    TabOrder = 3
    Visible = False
    object RadioGroup2: TRadioGroup
      Left = 8
      Top = 4
      Width = 305
      Height = 342
      Caption = #19987#19994#31867#21035#65306
      Columns = 2
      Items.Strings = (
        '0.4BS'
        '0.4BX'
        '0.4KV'#32447#36335'-0.4X'
        '10KV'#32447#36335'-10X'
        '35KV'#32447#36335'-35X'
        '110KV'#32447#36335'-110X'
        '10KV'#21464#30005'-10B'
        '35KV'#21464#30005'-35B'
        '110KV'#21464#30005'-110B'
        '0.4KV'#30005#32518'-0.4D'
        '10KV'#30005#32518'-10D'
        '35KV'#30005#32518'-35D'
        '110KV'#30005#32518'-110D'
        #20809#32518'-G'
        #22303#24314'-U'
        #30005#32518#26725'-Q'
        #25490#31649'-P'
        #39030#31649'-E'
        #25509#22320'-J'
        #20179#20301'-C'
        #36335#28783'-L'
        #20854#20182' -T')
      TabOrder = 2
    end
    object BitBtn3: TBitBtn
      Left = 8
      Top = 352
      Width = 70
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = BitBtn3Click
      Kind = bkOK
    end
    object BitBtn4: TBitBtn
      Left = 82
      Top = 352
      Width = 70
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
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
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 312
    Top = 80
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 5
  end
end
