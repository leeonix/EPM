object Fram_GetFee: TFram_GetFee
  Left = 0
  Top = 0
  Width = 626
  Height = 414
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = #23435#20307
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  TabStop = True
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 626
    Height = 24
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 6
      Width = 120
      Height = 14
      Caption = #29992#25143#24037#31243#25910#36153#24773#20917
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 24
    Width = 626
    Height = 67
    Align = alTop
    Alignment = taRightJustify
    BorderOuter = fsFlat
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 75
      Height = 15
      Caption = #24037#31243#24080#21495#65306
    end
    object Label3: TLabel
      Left = 8
      Top = 36
      Width = 75
      Height = 15
      Caption = #24037#31243#21517#31216#65306
    end
    object Label4: TLabel
      Left = 312
      Top = 12
      Width = 75
      Height = 15
      Caption = #21463#29702#26085#26399#65306
    end
    object prjname: TRzEdit
      Left = 96
      Top = 36
      Width = 409
      Height = 23
      ImeName = #32043#20809#21326#23431#25340#38899'V5'
      TabOrder = 0
    end
    object prjaccount: TRzButtonEdit
      Left = 96
      Top = 8
      Width = 209
      Height = 23
      Color = clInfoBk
      ImeName = #32043#20809#21326#23431#25340#38899'V5'
      ReadOnly = True
      TabOrder = 1
      OnChange = prjaccountChange
      OnButtonClick = prjaccountButtonClick
    end
    object slrq: TRzEdit
      Left = 376
      Top = 8
      Width = 129
      Height = 23
      ImeName = #32043#20809#21326#23431#25340#38899'V5'
      TabOrder = 2
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 91
    Width = 626
    Height = 323
    Align = alClient
    BorderStyle = cxcbsNone
    TabOrder = 2
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
          FieldName = 'sumBud'
          Column = cxGrid1DBTableView1DBColumn3
        end
        item
          Kind = skSum
          FieldName = 'HaveGet'
          Column = cxGrid1DBTableView1DBColumn4
        end
        item
          Kind = skSum
          FieldName = 'QF'
          Column = cxGrid1DBTableView1DBColumn5
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
        Caption = #24037#31243#24080#21495
        DataBinding.FieldName = 'prjaccount'
        Width = 101
      end
      object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
        Caption = #24037#31243#21517#31216
        DataBinding.FieldName = 'prjname'
        Width = 204
      end
      object cxGrid1DBTableView1DBColumn6: TcxGridDBColumn
        Caption = #31867#21035
        DataBinding.FieldName = 'buditem'
        Width = 76
      end
      object cxGrid1DBTableView1DBColumn3: TcxGridDBColumn
        Caption = #39044#31639#24635#20215
        DataBinding.FieldName = 'sumBud'
        SortIndex = 0
        SortOrder = soAscending
        Width = 80
      end
      object cxGrid1DBTableView1DBColumn4: TcxGridDBColumn
        Caption = #24050#25910#37329#39069
        DataBinding.FieldName = 'HaveGet'
        Width = 79
      end
      object cxGrid1DBTableView1DBColumn5: TcxGridDBColumn
        Caption = #27424#36153#37329#39069
        DataBinding.FieldName = 'Qf'
      end
    end
    object cxGrid1DBTableView2: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.First.Enabled = False
      NavigatorButtons.PriorPage.Enabled = False
      NavigatorButtons.NextPage.Enabled = False
      NavigatorButtons.Last.Enabled = False
      NavigatorButtons.SaveBookmark.Enabled = False
      NavigatorButtons.GotoBookmark.Enabled = False
      NavigatorButtons.Filter.Enabled = False
      DataController.DataSource = DataSource2
      DataController.DetailKeyFieldNames = 'Prjcode'
      DataController.KeyFieldNames = 'GetFeeId'
      DataController.MasterKeyFieldNames = 'prjcode'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
          FieldName = 'GetFee'
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.NavigatorHints = True
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsData.Appending = True
      OptionsView.Navigator = True
      OptionsView.ShowEditButtons = gsebAlways
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      OptionsView.NewItemRowInfoText = #21333#20987#36825#37324#22686#21152#35760#24405
      object cxGrid1DBTableView2GetFdate: TcxGridDBColumn
        Caption = #25910#36153#26085#26399
        DataBinding.FieldName = 'GetFdate'
      end
      object cxGrid1DBTableView2GetFee: TcxGridDBColumn
        Caption = #25910#36153#37329#39069
        DataBinding.FieldName = 'GetFee'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
      object cxGrid1Level2: TcxGridLevel
        GridView = cxGrid1DBTableView2
      end
    end
  end
  object ADOQuery1: TADOQuery
    Connection = Dm_Epm.cn_epm
    CursorType = ctStatic
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <>
    SQL.Strings = (
      
        'select a.prjcode as prjcode,prjaccount, prjname,budfee as sumBud' +
        ',buditem ,sum(Getfee) as HaveGet'
      'from projectinfo a inner join budget b on a.prjcode=b.prjcode'
      'left join GetcustomerFee c on a.prjcode=c.prjcode '
      'where  prjtype<>'#39'007'#39'  '
      'group by a.prjcode,prjaccount,prjname,budfee,buditem'
      ' ')
    Left = 344
    Top = 152
    object ADOQuery1prjcode: TStringField
      FieldName = 'prjcode'
      FixedChar = True
      Size = 13
    end
    object ADOQuery1prjaccount: TStringField
      FieldName = 'prjaccount'
      Size = 40
    end
    object ADOQuery1prjname: TStringField
      FieldName = 'prjname'
      Size = 60
    end
    object ADOQuery1sumBud: TBCDField
      FieldName = 'sumBud'
      ReadOnly = True
      Precision = 32
      Size = 2
    end
    object ADOQuery1buditem: TStringField
      FieldName = 'buditem'
      FixedChar = True
      Size = 14
    end
    object ADOQuery1HaveGet: TBCDField
      FieldName = 'HaveGet'
      ReadOnly = True
      Precision = 32
      Size = 2
    end
    object ADOQuery1QF: TFloatField
      FieldKind = fkCalculated
      FieldName = 'QF'
      Calculated = True
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 432
    Top = 152
  end
  object ADOQuery2: TADOQuery
    Connection = Dm_Epm.cn_epm
    CursorType = ctStatic
    BeforePost = ADOQuery2BeforePost
    Parameters = <>
    SQL.Strings = (
      'select * from GetCustomerFee ')
    Left = 520
    Top = 152
    object ADOQuery2Prjcode: TStringField
      FieldName = 'Prjcode'
      FixedChar = True
      Size = 13
    end
    object ADOQuery2GetFee: TBCDField
      FieldName = 'GetFee'
      Precision = 18
      Size = 2
    end
    object ADOQuery2GetFdate: TDateTimeField
      FieldName = 'GetFdate'
    end
    object ADOQuery2GetFeeId: TAutoIncField
      FieldName = 'GetFeeId'
      ReadOnly = True
    end
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 344
    Top = 216
  end
end
