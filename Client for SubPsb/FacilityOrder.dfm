object Fram_Facility: TFram_Facility
  Left = 0
  Top = 0
  Width = 545
  Height = 225
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  ParentFont = False
  PopupMenu = Frm_PrjDesign.PopupMenu1
  TabOrder = 0
  object DBGrid3: TDBGrid
    Left = 0
    Top = 30
    Width = 545
    Height = 160
    Align = alClient
    DataSource = ds_equipment
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ImeName = #37329#23665#33521#25991#20889#20316#21161#25163
    ParentFont = False
    PopupMenu = Frm_PrjDesign.PopupMenu1
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'sblb'
        PickList.Strings = (
          #37197#30005#21464#21387#22120
          #39640#21387#37197#30005#26588
          #20302#21387#37197#30005#26588)
        Title.Alignment = taCenter
        Title.Caption = #35774#22791#31867#21035
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sbxh'
        Title.Alignment = taCenter
        Title.Caption = #35774#22791#22411#21495
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sbsl'
        Title.Alignment = taCenter
        Title.Caption = #25968#37327
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ghcj'
        Title.Alignment = taCenter
        Title.Caption = #20379#36135#21378#23478
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 147
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dgrq'
        Title.Alignment = taCenter
        Title.Caption = #35746#36141#26085#26399
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dhrq'
        Title.Alignment = taCenter
        Title.Caption = #21040#36135#26085#26399
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 110
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 545
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 6
      Width = 105
      Height = 14
      Caption = #35774#22791#35746#36135#28165#21333#65306
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
      Width = 540
      Height = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 190
    Width = 545
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
        #24037#31243#31649#29702#31185#26681#25454#24037#31243#35774#35745#20070#35201#27714#65292#21046#23450#24037#31243#30456#20851#35774#22791#30340#35746#36135#35745#21010#21644#35774#22791#28165#21333#65292#21516#26102#23558#35774#22791#21040#36135#24773#20917#21450#26102#30331#35760#20197#20415#35745#21010#20154#21592#21450#26102#35843#25972#21644#21046#23450#24037#31243#23454#26045 +
        #30340#35814#32454#35745#21010#12290
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object ADOQry_equipment: TADOQuery
    Connection = Dm_Epm.cn_epm
    BeforePost = ADOQry_equipmentBeforePost
    Parameters = <
      item
        Name = 'mycode'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'select * from prjequipment'
      'where prjcode=:mycode')
    Left = 368
    Top = 64
    object ADOQry_equipmentsblb: TStringField
      FieldName = 'sblb'
    end
    object ADOQry_equipmentsbxh: TStringField
      FieldName = 'sbxh'
      Size = 30
    end
    object ADOQry_equipmentsbsl: TStringField
      FieldName = 'sbsl'
      FixedChar = True
      Size = 2
    end
    object ADOQry_equipmentghcj: TStringField
      FieldName = 'ghcj'
    end
    object ADOQry_equipmentdgrq: TDateTimeField
      FieldName = 'dgrq'
    end
    object ADOQry_equipmentdhrq: TDateTimeField
      FieldName = 'dhrq'
    end
    object ADOQry_equipmentxh: TBCDField
      FieldName = 'xh'
      ReadOnly = True
      Precision = 18
      Size = 0
    end
    object ADOQry_equipmentprjcode: TStringField
      FieldName = 'prjcode'
      FixedChar = True
      Size = 13
    end
  end
  object ds_equipment: TDataSource
    DataSet = ADOQry_equipment
    Left = 400
    Top = 64
  end
end
