object Fram_FlowTrace: TFram_FlowTrace
  Left = 0
  Top = 0
  Width = 585
  Height = 286
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
    Width = 585
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 6
      Width = 75
      Height = 14
      Caption = #33410#28857#36827#24230#65306
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
      Width = 568
      Height = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 251
    Width = 585
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
        #33410#28857#36827#24230#26159#31995#32479#33258#21160#35760#24405#30340#21508#20010#24037#20316#23703#20301#25110#29615#33410#23436#25104#24773#20917#30340#20449#24687#65292#25152#26377#25805#20316#26102#38388#22343#21462#33258#26381#21153#22120#26102#38388#65292#22914#26524#24037#31243#27969#36716#26377#22238#36864#31561#25805#20316#21017#33410#28857#36827#24230#35760#24405#30340 +
        #26159#26368#21518#19968#27425#25552#20132#20219#21153#30340#23436#25104#26102#38388#12290
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 30
    Width = 585
    Height = 221
    Align = alClient
    DataSource = Ds_node
    ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -14
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NODENAME'
        Title.Alignment = taCenter
        Width = 153
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXECUTOR'
        Title.Alignment = taCenter
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NODESTART'
        Title.Alignment = taCenter
        Width = 143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NODEEND'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ACTIVEFLAG'
        Title.Alignment = taCenter
        Title.Caption = #33410#28857#29366#24577
        Visible = True
      end>
  end
  object ADOQry_node: TADOQuery
    Connection = Dm_Epm.cn_epm
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 304
    Top = 88
    object ADOQry_nodeXMDM: TStringField
      FieldName = 'XMDM'
      FixedChar = True
      Size = 13
    end
    object ADOQry_nodeNODECODE: TStringField
      FieldName = 'NODECODE'
      FixedChar = True
      Size = 6
    end
    object ADOQry_nodeNODENAME: TStringField
      DisplayLabel = #20219#21153#21517#31216
      FieldName = 'NODENAME'
    end
    object ADOQry_nodeEXECUTOR: TStringField
      DisplayLabel = #25191#34892#20154
      FieldName = 'EXECUTOR'
      FixedChar = True
      Size = 8
    end
    object ADOQry_nodeNODESTART: TDateTimeField
      DisplayLabel = #20219#21153#24320#22987#26085#26399
      FieldName = 'NODESTART'
    end
    object ADOQry_nodeNODEEND: TDateTimeField
      DisplayLabel = #20219#21153#32467#26463#26085#26399
      FieldName = 'NODEEND'
      OnGetText = ADOQry_nodeNODEENDGetText
    end
    object ADOQry_nodeACTIVEFLAG: TStringField
      DisplayLabel = #27963#21160#26631#24535
      FieldName = 'ACTIVEFLAG'
      OnGetText = ADOQry_nodeACTIVEFLAGGetText
      FixedChar = True
      Size = 1
    end
  end
  object Ds_node: TDataSource
    DataSet = ADOQry_node
    Left = 304
    Top = 120
  end
end
