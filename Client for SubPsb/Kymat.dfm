object Fram_Kymat: TFram_Kymat
  Left = 0
  Top = 0
  Width = 544
  Height = 362
  TabOrder = 0
  object Panel2: TPanel
    Left = 0
    Top = 327
    Width = 544
    Height = 35
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 0
    object StaticText1: TStaticText
      Left = 8
      Top = 4
      Width = 536
      Height = 27
      AutoSize = False
      Caption = #20197#19978#34920#26684#21015#20986#30340#26159#39033#30446#25152#38656#20027#26448#26009#28165#21333#65292#25152#26377#26448#26009#35268#26684#22411#21495#12289#21333#20215#22343#37319#29992#30005#21147#20844#21496#32479#19968#26631#20934#30340#26448#26009#25968#25454#23383#20856#12290
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
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
      Width = 120
      Height = 14
      Caption = #21487#30740#20027#26448#26009#28165#21333#65306
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
      Width = 539
      Height = 3
    end
    object BitBtn1: TBitBtn
      Left = 184
      Top = 0
      Width = 73
      Height = 25
      Caption = #20445#23384#26356#26032
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 30
    Width = 544
    Height = 297
    Align = alClient
    DataSource = ds_mat
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -14
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    BeforePost = ClientDataSet1BeforePost
    Left = 328
    Top = 144
    object ClientDataSet1name: TStringField
      DisplayLabel = #26448#26009#21517#31216
      DisplayWidth = 40
      FieldKind = fkLookup
      FieldName = 'name'
      LookupDataSet = ADOqry_Kymat
      LookupKeyFields = 'MATID'
      LookupResultField = 'NAME'
      KeyFields = 'MATID'
      ReadOnly = True
      Size = 80
      Lookup = True
    end
    object ClientDataSet1spec: TStringField
      DisplayLabel = #22411#21495#21450#35268#26684
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'spec'
      LookupDataSet = ADOqry_Kymat
      LookupKeyFields = 'MATID'
      LookupResultField = 'SPEC'
      KeyFields = 'MATID'
      ReadOnly = True
      Size = 120
      Lookup = True
    end
    object ClientDataSet1unit: TStringField
      DisplayLabel = #21333#20301
      DisplayWidth = 5
      FieldKind = fkLookup
      FieldName = 'unit'
      LookupDataSet = ADOqry_Kymat
      LookupKeyFields = 'MATID'
      LookupResultField = 'UNIT'
      KeyFields = 'MATID'
      ReadOnly = True
      Size = 10
      Lookup = True
    end
    object ClientDataSet1Price: TBCDField
      DisplayLabel = #21333#20215
      FieldName = 'Price'
      Precision = 10
      Size = 2
    end
    object ClientDataSet1NUM: TBCDField
      DisplayLabel = #25968#37327
      DisplayWidth = 11
      FieldName = 'NUM'
      Precision = 10
      Size = 2
    end
    object ClientDataSet1NOTE: TStringField
      DisplayLabel = #22791#27880
      DisplayWidth = 16
      FieldName = 'NOTE'
      Size = 40
    end
    object ClientDataSet1MATID: TIntegerField
      FieldName = 'MATID'
      Visible = False
    end
    object ClientDataSet1PRJCODE: TStringField
      FieldName = 'PRJCODE'
      Visible = False
      FixedChar = True
      Size = 13
    end
    object ClientDataSet1id: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = ADOQry_Kyprjmat
    Constraints = True
    Left = 368
    Top = 144
  end
  object ADOqry_Kymat: TADOQuery
    Active = True
    Connection = Dm_Epm.cn_epm
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from material _ky')
    Left = 400
    Top = 88
  end
  object ADOQry_Kyprjmat: TADOQuery
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
      'select * from PRJ_MATERIAL_ky'
      'where prjcode=:mycode')
    Left = 440
    Top = 88
    object ADOQry_KyprjmatPRJCODE: TStringField
      FieldName = 'PRJCODE'
      FixedChar = True
      Size = 13
    end
    object ADOQry_KyprjmatMATID: TIntegerField
      FieldName = 'MATID'
    end
    object ADOQry_KyprjmatNUM: TBCDField
      FieldName = 'NUM'
      Precision = 10
      Size = 2
    end
    object ADOQry_KyprjmatNOTE: TStringField
      FieldName = 'NOTE'
    end
    object ADOQry_Kyprjmatid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object ADOQry_KyprjmatPrice: TBCDField
      FieldName = 'Price'
      Precision = 10
      Size = 2
    end
  end
  object ds_mat: TDataSource
    DataSet = ClientDataSet1
    Left = 296
    Top = 144
  end
  object PopupMenu1: TPopupMenu
    Left = 472
    Top = 136
    object N1: TMenuItem
      Caption = #22686#21152#26448#26009'...'
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21024#38500#26448#26009
      OnClick = N2Click
    end
  end
end
