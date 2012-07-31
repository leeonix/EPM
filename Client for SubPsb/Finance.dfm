object Fram_Finance: TFram_Finance
  Left = 0
  Top = 0
  Width = 570
  Height = 373
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -18
  Font.Name = #23435#20307
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object DBGrid1: TDBGrid
    Left = 0
    Top = 30
    Width = 570
    Height = 147
    Align = alTop
    DataSource = ds_finance
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ImeName = #37329#23665#33521#25991#20889#20316#21161#25163
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -18
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'BUDITEM'
        Width = 204
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BUDFEE'
        Width = 168
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FEENUM'
        Title.Alignment = taCenter
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 166
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 570
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Bevel1: TBevel
      Left = 4
      Top = 24
      Width = 541
      Height = 3
    end
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 105
      Height = 14
      Caption = #39044#31639#36153#29992#28165#21333#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 338
    Width = 570
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
      Caption = #36130#21153#37096#38376#23558#24037#31243#26045#24037#32467#26463#21518#65292#26681#25454#24037#31243#31649#29702#31185#19978#25253#30340#32467#36134#28165#21333#23558#21508#26045#24037#21333#20301#30340#32467#31639#37329#39069#36755#20837#20197#20415#20998#26512#27604#36739#24037#31243#39033#30446#36164#37329#39044#20915#31639#24046#24322#12290
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 218
    Width = 570
    Height = 120
    Align = alBottom
    DataSource = DataSource1
    TabOrder = 3
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -18
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'SGLB'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SGDW'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 236
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HTJE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JLF'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JSJE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        Title.Alignment = taCenter
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JSRQ'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        Title.Alignment = taCenter
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 114
        Visible = True
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 177
    Width = 570
    Height = 41
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    object Label1: TLabel
      Left = 8
      Top = 22
      Width = 150
      Height = 14
      Caption = #21512#21516#21450#36130#21153#32467#31639#28165#21333#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object ADOqry_BUD: TADOQuery
    Connection = Dm_Epm.cn_epm
    CursorType = ctStatic
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
      'select * from budget a,designcost b'
      'where a.prjcode=b.prjcode'
      '    and a.buditem=b.feeitem'
      '    and a.prjcode=:mycode')
    Left = 432
    Top = 88
    object ADOqry_BUDPRJCODE: TStringField
      FieldName = 'PRJCODE'
      FixedChar = True
      Size = 13
    end
    object ADOqry_BUDBUDITEM: TStringField
      DisplayLabel = #39044#31639#31867#21035
      FieldName = 'BUDITEM'
      FixedChar = True
      Size = 14
    end
    object ADOqry_BUDBUDFEE: TBCDField
      DisplayLabel = #39044#31639#36153#37329#39069
      FieldName = 'BUDFEE'
      Precision = 11
      Size = 2
    end
    object ADOqry_BUDFEENUM: TBCDField
      DisplayLabel = #35774#35745#36153#37329#39069
      FieldName = 'FEENUM'
      Precision = 10
      Size = 2
    end
  end
  object ds_finance: TDataSource
    DataSet = ADOqry_BUD
    Left = 392
    Top = 88
  end
  object ADOqry_finance: TADOQuery
    Connection = Dm_Epm.cn_epm
    CursorType = ctStatic
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
      'select * from arrange'
      'where prjcode=:mycode')
    Left = 456
    Top = 136
    object ADOqry_financeSGDW: TStringField
      DisplayLabel = #26045#24037#21333#20301
      FieldName = 'SGDW'
      Size = 40
    end
    object ADOqry_financeSGLB: TStringField
      DisplayLabel = #31867#21035
      FieldName = 'SGLB'
    end
    object ADOqry_financeHTJE: TStringField
      DisplayLabel = #21512#21516#37329#39069
      FieldName = 'HTJE'
      Size = 10
    end
    object ADOqry_financeJSJE: TStringField
      DisplayLabel = #32467#31639#37329#39069
      FieldName = 'JSJE'
      Size = 10
    end
    object ADOqry_financeJLF: TStringField
      DisplayLabel = #30417#29702#36153
      FieldName = 'JLF'
      Size = 10
    end
    object ADOqry_financeJSRQ: TDateTimeField
      DisplayLabel = #32467#31639#26085#26399
      FieldName = 'JSRQ'
      OnGetText = ADOqry_financeJSRQGetText
      OnSetText = ADOqry_financeJSRQSetText
      EditMask = '9999\'#24180'99\'#26376'99\'#26085';1;_'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOqry_finance
    Left = 488
    Top = 136
  end
end
