object frm_Ciprj: Tfrm_Ciprj
  Left = 325
  Top = 109
  Width = 564
  Height = 468
  Caption = #29992#25143#20869#37096#24037#31243
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 384
    Width = 556
    Height = 50
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Button1: TButton
      Left = 312
      Top = 9
      Width = 83
      Height = 31
      Caption = #20445#23384
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 416
      Top = 9
      Width = 83
      Height = 31
      Caption = #36864#20986
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ModalResult = 2
      ParentFont = False
      TabOrder = 1
    end
  end
  inline Fram_CustmerPrj1: TFram_CustmerPrj
    Left = 0
    Top = 0
    Width = 556
    Height = 384
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    inherited Panel1: TPanel
      Width = 556
    end
    inherited Panel2: TPanel
      Top = 349
      Width = 556
    end
    inherited Panel3: TPanel
      Width = 556
      Height = 319
    end
  end
end
