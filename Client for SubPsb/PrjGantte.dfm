object Fram_gante: TFram_gante
  Left = 0
  Top = 0
  Width = 544
  Height = 409
  TabOrder = 0
  object chart1: TChart
    Left = 0
    Top = 30
    Width = 544
    Height = 320
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      '')
    OnClickSeries = chart1ClickSeries
    LeftAxis.DateTimeFormat = 'yyyy-MM-dd'
    LeftAxis.Inverted = True
    Legend.Visible = False
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 0
    OnDblClick = chart1DblClick
    object gantte: TGanttSeries
      ColorEachPoint = True
      Marks.ArrowLength = 0
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'gantte'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = True
      XValues.DateTime = True
      XValues.Name = 'Start'
      XValues.Multiplier = 1
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1
      YValues.Order = loNone
      StartValues.DateTime = True
      StartValues.Name = 'Start'
      StartValues.Multiplier = 1
      StartValues.Order = loAscending
      EndValues.DateTime = True
      EndValues.Name = 'End'
      EndValues.Multiplier = 1
      EndValues.Order = loNone
      NextTask.DateTime = False
      NextTask.Name = 'NextTask'
      NextTask.Multiplier = 1
      NextTask.Order = loNone
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 544
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 6
      Width = 60
      Height = 14
      Caption = #29976#29305#22270#65306
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
    Top = 374
    Width = 544
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
      Caption = #24037#31243#39033#30446#29976#29305#22270#26159#29992#22270#24418#26041#24335#34920#36798#24037#31243#30340#23454#38469#36827#24230#24773#20917#65292#21333#20987#27700#24179#26041#21521#19978#30340#36827#24230#26465#21487#20197#26597#30475#33410#28857#30340#23436#25104#26102#38388#12290
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 350
    Width = 544
    Height = 24
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 3
  end
  object ADOQry_node: TADOQuery
    Connection = Dm_Epm.cn_epm
    CursorType = ctStatic
    Parameters = <>
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
    end
    object ADOQry_nodeACTIVEFLAG: TStringField
      DisplayLabel = #27963#21160#26631#24535
      FieldName = 'ACTIVEFLAG'
      FixedChar = True
      Size = 1
    end
  end
end
