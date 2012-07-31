object Fram_Dwg: TFram_Dwg
  Left = 0
  Top = 0
  Width = 545
  Height = 287
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
    Width = 545
    Height = 222
    Align = alClient
    DataSource = Dm_Epm.ds_doc
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
    ParentFont = False
    PopupMenu = Frm_PrjDesign.PopupMenu1
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
        FieldName = 'id'
        Title.Alignment = taCenter
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOCNAME'
        Title.Alignment = taCenter
        Title.Caption = #22270#26723#21517#31216
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 178
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LAYOUT'
        Title.Alignment = taCenter
        Title.Caption = #22270#24133
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SCALE'
        Title.Alignment = taCenter
        Title.Caption = #27604#20363
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VERSION'
        Title.Alignment = taCenter
        Title.Caption = #29256#26412
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CREATEBY'
        Title.Alignment = taCenter
        Title.Caption = #20316#32773
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CREATEDATE'
        Title.Alignment = taCenter
        Title.Caption = #30331#35760#26102#38388
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 97
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
      Caption = #35774#35745#22270#32440#30446#24405#65306
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
    Top = 252
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
      Caption = #35774#35745#24072#23558#24037#31243#22270#32440#30331#35760#21040#24037#31243#22270#26723#31649#29702#22120#20013#65292#20197#20415#32479#19968#31649#29702#21644#32593#32476#21327#21516#24037#20316#65292#25171#24320#27983#35272#36719#20214#21487#20197#23545#22270#32440#36827#34892#21508#31867#25209#27880#25110#22280#38405#26041#20415#20132#27969#35774#35745#24605#24819#12290
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object Query1: TQuery
    DatabaseName = 'DOC'
    SessionName = 'Default'
    SQL.Strings = (
      
        'SELECT PRJID, DOCTYPE, DOCNAME, FILENAME, CREATDATE, AUTHOR, LAY' +
        'OUT, '
      '    VERSION, scale'
      'FROM dbo.ENGDOUMNET'
      'WHERE PRJID=:prjacc')
    Left = 400
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'prjacc'
        ParamType = ptUnknown
      end>
  end
  object Database1: TDatabase
    AliasName = 'DOCDB'
    DatabaseName = 'DOC'
    LoginPrompt = False
    Params.Strings = (
      'user name=sa')
    SessionName = 'Default'
    Left = 312
    Top = 80
  end
end
