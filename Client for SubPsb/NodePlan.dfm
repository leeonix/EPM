object Fram_Nodeplan: TFram_Nodeplan
  Left = 0
  Top = 0
  Width = 539
  Height = 340
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
      Width = 120
      Height = 14
      Caption = #39033#30446#33410#28857#35745#21010#34920#65306
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
    object SpeedButton1: TSpeedButton
      Left = 312
      Top = 0
      Width = 121
      Height = 22
      Caption = #23548#20986#21040'MS Project'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 305
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
      Caption = #39033#30446#33410#28857#35745#21010#26159#31995#32479#26681#25454#21508#31867#24037#31243#30340#26631#20934#27969#31243#35774#32622#33258#21160#29983#25104#30340#21508#29615#33410#24037#20316#26085#32771#26680#35745#21010#26085#26399#12290#39033#30446#36127#36131#20154#25110#31995#32479#31649#29702#21592#21487#20197#26356#25913#35843#33410#35745#21010#12290
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
    Top = 30
    Width = 539
    Height = 275
    Align = alClient
    DataSource = Ds_plan
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
        FieldName = 'taskname'
        Title.Caption = #20219#21153#21517#31216
        Width = 166
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLANSTART'
        Title.Caption = #35745#21010#24320#22987#26085#26399
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLANEND'
        Title.Caption = #35745#21010#32467#26463#26085#26399
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tasktip'
        Title.Caption = #20219#21153#20027#39064
        Width = 122
        Visible = True
      end>
  end
  object ADOQry_nodeplan: TADOQuery
    Connection = Dm_Epm.cn_epm
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from nodeplan,tasknode'
      'where nodecode=taskcode and xmdm='#39'P001200112003'#39)
    Left = 208
    Top = 112
    object ADOQry_nodeplanPLANSTART: TDateTimeField
      FieldName = 'PLANSTART'
    end
    object ADOQry_nodeplanPLANEND: TDateTimeField
      FieldName = 'PLANEND'
    end
    object ADOQry_nodeplantaskname: TStringField
      FieldName = 'taskname'
    end
    object ADOQry_nodeplantasktip: TStringField
      FieldName = 'tasktip'
      Size = 50
    end
    object ADOQry_nodeplanNODECODE: TStringField
      FieldName = 'NODECODE'
      FixedChar = True
      Size = 6
    end
  end
  object Ds_plan: TDataSource
    DataSet = ADOQry_nodeplan
    Left = 288
    Top = 120
  end
end
