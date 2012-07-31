object frm_importSj: Tfrm_importSj
  Left = 0
  Top = 0
  Caption = #23457#20215#28165#21333#23548#20837
  ClientHeight = 556
  ClientWidth = 913
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object RzLabel1: TRzLabel
    Left = 709
    Top = 32
    Width = 196
    Height = 14
    Caption = #20197#19979#24037#31243#23457#20215#20449#24687#26410#33021#23548#20837#31995#32479
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 64
    Width = 673
    Height = 435
    DataSource = DataSource1
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object rzpnl2: TRzPanel
    Left = 0
    Top = 513
    Width = 913
    Height = 43
    Align = alBottom
    BorderSides = []
    TabOrder = 1
    ExplicitTop = 511
    ExplicitWidth = 1064
    object btn_import: TRzButton
      Left = 536
      Top = 6
      Width = 161
      Height = 33
      Caption = #23548#20837#23457#20215#39033#30446#28165#21333
      TabOrder = 0
      OnClick = btn_importClick
    end
    object RzButton2: TRzButton
      Left = 711
      Top = 8
      Width = 80
      Height = 33
      Caption = #36864#20986
      TabOrder = 1
      OnClick = RzButton2Click
    end
  end
  object RzListBox1: TRzListBox
    Left = 711
    Top = 64
    Width = 194
    Height = 435
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    Style = lbOwnerDrawFixed
    TabOrder = 2
  end
  object RzRadioGroup1: TRzRadioGroup
    Left = 8
    Top = 0
    Width = 673
    Height = 58
    BorderOuter = fsButtonDown
    Caption = #35831#36873#25321#34920#26684#28165#21333#31867#22411
    CaptionFont.Charset = GB2312_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -15
    CaptionFont.Name = #23435#20307
    CaptionFont.Style = []
    Columns = 2
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #26032#23435#20307
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      #22806#23457#28165#21333
      #20869#23457#28165#21333)
    ParentFont = False
    TabOrder = 3
  end
  object dlgOpen1: TOpenDialog
    Left = 552
    Top = 112
  end
  object qry1: TADOQuery
    Connection = Dm_Epm.cn_epm
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'mycode'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT SjNo,PRJACCOUNT, TYPENAME, PRJNAME,Sgdw,sghtbh,Htje,SsPri' +
        'ce,SjPrice,PrintDate, Sgkgrq,Sgjgrq,JfSjFee,YfSjFee FROM dbo.Pro' +
        'jectSj '
      
        'INNER JOIN dbo.PROJECTINFO ON  dbo.ProjectSj.PrjCode = dbo.PROJE' +
        'CTINFO.PRJCODE'
      
        'INNER JOIN dbo.PROJECTTYPE ON dbo.PROJECTINFO.PRJTYPE = dbo.PROJ' +
        'ECTTYPE.PRJTYPECODE'
      
        'Left JOIN dbo.ARRANGE ON dbo.PROJECTINFO.PRJCODE=dbo.ARRANGE.Prj' +
        'Code'
      'WHERE SjDate=:mycode')
    Left = 480
    Top = 112
    object qry1SjNo: TWideStringField
      DisplayLabel = #23457#20215#25253#21578#32534#21495
      DisplayWidth = 26
      FieldName = 'SjNo'
      Size = 30
    end
    object qry1PRJACCOUNT: TStringField
      DisplayLabel = #24037#31243#36134#21495
      DisplayWidth = 48
      FieldName = 'PRJACCOUNT'
      Size = 40
    end
    object qry1TYPENAME: TStringField
      DisplayLabel = #24037#31243#24615#36136
      DisplayWidth = 24
      FieldName = 'TYPENAME'
    end
    object qry1PRJNAME: TStringField
      DisplayLabel = #24037#31243#21517#31216
      DisplayWidth = 59
      FieldName = 'PRJNAME'
      Size = 60
    end
    object qry1Sgdw: TStringField
      DisplayLabel = #26045#24037#21333#20301
      DisplayWidth = 48
      FieldName = 'Sgdw'
      Size = 40
    end
    object qry1sghtbh: TStringField
      DisplayLabel = #26045#24037#21512#21516#32534#21495
      DisplayWidth = 24
      FieldName = 'sghtbh'
      FixedChar = True
    end
    object qry1Htje: TStringField
      DisplayLabel = #26045#24037#21512#21516#37329#39069
      DisplayWidth = 15
      FieldName = 'Htje'
      Size = 10
    end
    object qry1SsPrice: TIntegerField
      DisplayLabel = #36865#23457#20215
      DisplayWidth = 12
      FieldName = 'SsPrice'
    end
    object qry1SjPrice: TIntegerField
      DisplayLabel = #23457#23450#20215
      DisplayWidth = 12
      FieldName = 'SjPrice'
    end
    object qry1PrintDate: TDateTimeField
      DisplayLabel = #21512#21516#31614#35746#26085#26399
      DisplayWidth = 22
      FieldName = 'PrintDate'
    end
    object qry1Sgkgrq: TDateTimeField
      DisplayLabel = #23454#38469#24320#24037#26085#26399
      DisplayWidth = 22
      FieldName = 'Sgkgrq'
    end
    object qry1Sgjgrq: TDateTimeField
      DisplayLabel = #23454#38469#31459#24037#26085#26399
      DisplayWidth = 22
      FieldName = 'Sgjgrq'
    end
    object qry1JfSjFee: TIntegerField
      DisplayLabel = #30002#26041#23457#20215#36153
      DisplayWidth = 12
      FieldName = 'JfSjFee'
    end
    object qry1YfSjFee: TIntegerField
      DisplayLabel = #20057#26041#23457#20215#36153
      DisplayWidth = 12
      FieldName = 'YfSjFee'
    end
  end
  object DataSource1: TDataSource
    DataSet = qry1
    Left = 440
    Top = 112
  end
end
