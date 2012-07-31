object Fram_Moddesign: TFram_Moddesign
  Left = 0
  Top = 0
  Width = 553
  Height = 368
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 553
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 6
      Width = 105
      Height = 14
      Caption = #35774#35745#26356#25913#35760#24405#65306
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 30
    Width = 553
    Height = 303
    Align = alClient
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
    ParentFont = False
    PopupMenu = Frm_PrjDesign.PopupMenu1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -18
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
  end
  object Panel2: TPanel
    Left = 0
    Top = 333
    Width = 553
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
        #22914#26524#24037#31243#39033#30446#38656#35201#35774#35745#26356#25913#65292#35774#35745#20154#21592#39318#20808#22635#20889#35774#35745#26356#25913#36890#30693#21333#65292#36890#30693#21333#32463#25209#20934#21518#39033#30446#23558#34987#26631#35782#20026#22788#20110#35774#35745#26356#25913#29366#24577#24182#22312#27969#31243#20013#38145#23450#65292#26356#25913#23436#25104#21518 +
        #35299#38500#38145#23450#29366#24577#65292#33410#28857#31995#32479#35760#24405#27599#27425#26356#25913#30340#24773#20917#12290
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
end
