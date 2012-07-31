object Fram_log: TFram_log
  Left = 0
  Top = 0
  Width = 539
  Height = 240
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 539
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 6
      Width = 75
      Height = 14
      Caption = #33410#28857#26085#24535#65306
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
    Top = 205
    Width = 539
    Height = 35
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    object StaticText1: TStaticText
      Left = 8
      Top = 5
      Width = 536
      Height = 27
      AutoSize = False
      Caption = 
        #33410#28857#26085#24535#26159#31995#32479#33258#21160#35760#24405#30340#21508#20010#24037#20316#23703#20301#25110#29615#33410#20114#30456#36882#20132#27969#36716#24037#31243#39033#30446#30340#20449#24687#65292#25152#26377#25805#20316#26102#38388#22343#21462#33258#26381#21153#22120#26102#38388#65292#24544#23454#35760#24405#24037#31243#39033#30446#21160#24577#36712#36857#65292#25552 +
        #20379#24037#20316#30340#21487#36861#28335#24615#12290
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object Lsv_log: TListView
    Left = 0
    Top = 30
    Width = 539
    Height = 175
    Align = alClient
    Columns = <
      item
        Caption = #25805#20316#26102#38388
        Width = 122
      end
      item
        Caption = #25805#20316#20154
        Width = 81
      end
      item
        Caption = #25805#20316#21160#20316
        Width = 122
      end
      item
        Caption = #30446#26631#25191#34892#20154
        Width = 100
      end>
    HideSelection = False
    RowSelect = True
    TabOrder = 2
    ViewStyle = vsReport
  end
end
