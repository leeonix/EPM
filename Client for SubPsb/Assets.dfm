object Fram_gdzc: TFram_gdzc
  Left = 0
  Top = 0
  Width = 542
  Height = 238
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = #23435#20307
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  TabStop = True
  object DBGrid1: TDBGrid
    Left = 0
    Top = 30
    Width = 542
    Height = 173
    Align = alClient
    DataSource = DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #24207#21495
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOCNAME'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #26126#32454#34920#21517#31216
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 248
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CREATEBY'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #22635#25253#20154
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CREATEDATE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #22635#25253#26085#26399
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 165
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 542
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 6
      Width = 120
      Height = 14
      Caption = #36164#20135#22686#36164#26126#32454#34920#65306
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
    Top = 203
    Width = 542
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
        #24037#31243#31459#24037#21518#65292#36816#34892#37096#38376#24212#23558#26412#24037#31243#24341#36215#30340#22266#23450#36164#20135#22686#20943#24773#20917#26126#32454#34920#30331#35760#65292#21333#20987#24037#20855#26639#19978#30340#26032#22686#25353#38062#25110#20174#21491#38190#33756#21333#20013#36873#25321#26032#22686#65292#21487#20197#23558#36164#20135#26126#32454#34920#26684 +
        #30331#35760#31995#32479#20013#12290#21333#20987#25171#24320#21487#20197#25171#24320#25353#38062#26126#32454#34920#12290
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object Adoqry_assets: TADOQuery
    Connection = Dm_Epm.cn_epm
    OnCalcFields = Adoqry_assetsCalcFields
    Parameters = <
      item
        Name = 'mycode'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 13
        Value = Null
      end>
    SQL.Strings = (
      'select * from docinfo'
      'where doctype='#39#22686#36164#26126#32454#34920#39
      'and ssxmdm=:mycode')
    Left = 416
    Top = 72
    object Adoqry_assetsid: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'id'
      Calculated = True
    end
    object Adoqry_assetsDOCNAME: TStringField
      FieldName = 'DOCNAME'
      Size = 30
    end
    object Adoqry_assetsDOCTYPE: TStringField
      FieldName = 'DOCTYPE'
    end
    object Adoqry_assetsCREATEBY: TStringField
      FieldName = 'CREATEBY'
      FixedChar = True
      Size = 8
    end
    object Adoqry_assetsFILENAME: TStringField
      FieldName = 'FILENAME'
      Size = 80
    end
    object Adoqry_assetsCREATEDATE: TDateTimeField
      FieldName = 'CREATEDATE'
    end
    object Adoqry_assetsSSXMDM: TStringField
      FieldName = 'SSXMDM'
      FixedChar = True
      Size = 13
    end
  end
  object DataSource1: TDataSource
    DataSet = Adoqry_assets
    Left = 416
    Top = 104
  end
  object OpenDialog1: TOpenDialog
    Left = 456
    Top = 72
  end
end
