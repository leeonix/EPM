object Fram_Mat: TFram_Mat
  Left = 0
  Top = 0
  Width = 559
  Height = 356
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -18
  Font.Name = #23435#20307
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  TabStop = True
  object Panel2: TPanel
    Left = 0
    Top = 321
    Width = 559
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
      Caption = 
        #20197#19978#34920#26684#21015#20986#30340#26159#35774#35745#20154#21592#22312#35774#35745#22270#32440#19978#32473#20986#30340#24037#31243#25152#38656#20027#26448#26009#28165#21333'(BOM)'#12290#35774#35745#20154#21592#21482#35201#22312'AUTO CAD'#35774#35745#29615#22659#37319#29992#26216#36745#20844#21496#24320#21457#30340 +
        #26448#26009#36755#20837#36741#21161#21151#33021#23601#21487#33258#21160#36798#21040#19968#27425#36755#20837#65292#20840#23616#20849#20139#30340#30446#26631#12290
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
    Width = 559
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 6
      Width = 120
      Height = 14
      Caption = #24037#31243#20027#26448#26009#28165#21333#65306
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
    object SpeedButton1: TSpeedButton
      Left = 336
      Top = 0
      Width = 30
      Height = 25
      Hint = #19978#31227
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003C3333339333
        337437FFF3337F3333F73CCC33339333344437773F337F33377733CCC3339337
        4447337F73FF7F3F337F33CCCCC3934444433373F7737F773373333CCCCC9444
        44733337F337773337F3333CCCCC9444443333373F337F3337333333CCCC9444
        473333337F337F337F333333CCCC94444333333373F37F33733333333CCC9444
        7333333337F37F37F33333333CCC944433333333373F7F373333333333CC9447
        33333333337F7F7F3333333333CC94433333333333737F7333333333333C9473
        33333333333737F333333333333C943333333333333737333333333333339733
        3333333333337F33333333333333933333333333333373333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 376
      Top = 0
      Width = 30
      Height = 25
      Hint = #19979#31227
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333393333
        333333333337F3333333333333397333333333333337FF333333333333C94333
        3333333333737F333333333333C9473333333333337373F3333333333CC94433
        3333333337F7F7F3333333333CC94473333333333737F73F33333333CCC94443
        333333337F37F37F33333333CCC94447333333337337F373F333333CCCC94444
        33333337F337F337F333333CCCC94444733333373337F3373F3333CCCCC94444
        4333337F3337FF337F3333CCCCC94444473333733F7773FF73F33CCCCC393444
        443337F37737F773F7F33CCC33393374447337F73337F33737FFCCC333393333
        444377733337F333777FC3333339333337437333333733333373}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton2Click
    end
    object BitBtn1: TBitBtn
      Left = 176
      Top = 0
      Width = 73
      Height = 25
      Caption = #20445#23384#26356#26032
      DoubleBuffered = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 30
    Width = 559
    Height = 291
    Align = alClient
    DataSource = ds_mat
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
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
  object ADOQry_prjmat: TADOQuery
    Connection = Dm_Epm.cn_epm
    CursorType = ctStatic
    BeforePost = ADOQry_prjmatBeforePost
    OnPostError = ADOQry_prjmatPostError
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
      'select * from PRJ_MATERIAL '
      'where prjcode=:mycode'
      'order by itemNO')
    Left = 464
    Top = 168
    object ADOQry_prjmatPRJCODE: TStringField
      FieldName = 'PRJCODE'
      FixedChar = True
      Size = 13
    end
    object ADOQry_prjmatMATID: TIntegerField
      FieldName = 'MATID'
    end
    object ADOQry_prjmatNUM: TBCDField
      FieldName = 'NUM'
      Precision = 10
      Size = 2
    end
    object ADOQry_prjmatNOTE: TStringField
      FieldName = 'NOTE'
    end
    object ADOQry_prjmatitemNO: TSmallintField
      FieldName = 'itemNO'
    end
    object ADOQry_prjmatid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
  end
  object ds_mat: TDataSource
    DataSet = ClientDataSet1
    Left = 432
    Top = 168
  end
  object PopupMenu1: TPopupMenu
    Left = 400
    Top = 200
    object N1: TMenuItem
      Caption = #22686#21152#26448#26009'...'
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21024#38500#26448#26009
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #20462#25913'...'
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object Bom1: TMenuItem
      Caption = #25171#21360'Bom'#34920
      OnClick = Bom1Click
    end
  end
  object ADOqry_material: TADOQuery
    Connection = Dm_Epm.cn_epm
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from material ')
    Left = 368
    Top = 200
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    BeforePost = ClientDataSet1BeforePost
    Left = 368
    Top = 168
    object ClientDataSet1itemNO: TSmallintField
      DisplayLabel = #24207#21495
      DisplayWidth = 5
      FieldName = 'itemNO'
      Visible = False
    end
    object ClientDataSet1sncode: TStringField
      DisplayLabel = #26448#26009#32534#21495
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'sncode'
      LookupDataSet = ADOqry_material
      LookupKeyFields = 'MATID'
      LookupResultField = 'SNCODE'
      KeyFields = 'MATID'
      ReadOnly = True
      Lookup = True
    end
    object ClientDataSet1name: TStringField
      DisplayLabel = #26448#26009#21517#31216
      DisplayWidth = 40
      FieldKind = fkLookup
      FieldName = 'name'
      LookupDataSet = ADOqry_material
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
      LookupDataSet = ADOqry_material
      LookupKeyFields = 'MATID'
      LookupResultField = 'SPEC'
      KeyFields = 'MATID'
      ReadOnly = True
      Size = 80
      Lookup = True
    end
    object ClientDataSet1unit: TStringField
      DisplayLabel = #21333#20301
      DisplayWidth = 5
      FieldKind = fkLookup
      FieldName = 'unit'
      LookupDataSet = ADOqry_material
      LookupKeyFields = 'MATID'
      LookupResultField = 'UNIT'
      KeyFields = 'MATID'
      ReadOnly = True
      Size = 10
      Lookup = True
    end
    object ClientDataSet1NUM: TBCDField
      DisplayLabel = #25968#37327
      DisplayWidth = 5
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
    DataSet = ADOQry_prjmat
    Left = 400
    Top = 176
  end
end
