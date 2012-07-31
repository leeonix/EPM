object Frame_remark: TFrame_remark
  Left = 0
  Top = 0
  Width = 552
  Height = 242
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -20
  Font.Name = #23435#20307
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object RE_REMARK: TRichEdit
    Left = 0
    Top = 31
    Width = 552
    Height = 176
    Align = alClient
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    ParentFont = False
    PopupMenu = PopupMenu1
    ScrollBars = ssBoth
    TabOrder = 0
    WordWrap = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 552
    Height = 31
    Align = alTop
    BevelOuter = bvNone
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 6
      Width = 60
      Height = 14
      Caption = #30041#35328#26495#65306
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
      Width = 533
      Height = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 207
    Width = 552
    Height = 35
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 2
    object StaticText1: TStaticText
      Left = 8
      Top = 5
      Width = 536
      Height = 27
      AutoSize = False
      Caption = 
        #20844#20849#30041#35328#26495#26159#21333#39033#24037#31243#25972#20010#36807#31243#20013#65292#21508#20010#24037#20316#23703#20301#21442#19982#20154#21592#23545#24037#31243#20855#20307#24773#20917#34917#20805#35828#26126#20197#21450#20449#24687#30340#31616#21333#20132#27969#30340#31354#38388#12290#35831#27880#24847#35328#35770#25514#35789#65292#30041#35328#19968#26086#21457#36865 +
        #21017#19981#21487#21024#38500#12290
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object Qry_log: TQuery
    DatabaseName = 'doc_db'
    Left = 204
    Top = 90
  end
  object PopupMenu1: TPopupMenu
    Left = 256
    Top = 96
    object N1: TMenuItem
      Caption = #30041#35328
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21024#38500#30041#35328
    end
  end
end
