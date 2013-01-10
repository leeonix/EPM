object frm_sjdw: Tfrm_sjdw
  Left = 0
  Top = 0
  Caption = #35774#35745#21333#20301#20449#24687#32500#25252
  ClientHeight = 357
  ClientWidth = 774
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 774
    Height = 298
    Align = alTop
    DataSource = DataSource1
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Name'
        Title.Caption = #35774#35745#21333#20301#21517#31216
        Width = 235
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Address'
        Title.Caption = #20844#21496#22320#22336
        Width = 186
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tel'
        Title.Caption = #20844#21496#30005#35805
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fax'
        Title.Caption = #20256#30495
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Postcode'
        Title.Caption = #37038#32534
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Bankname'
        Title.Caption = #24320#25143#34892
        Width = 197
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Bankaccount'
        Title.Caption = #36134#21495
        Width = 166
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 32
    Top = 312
    Width = 300
    Height = 25
    DataSource = DataSource1
    VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
    Flat = True
    Hints.Strings = (
      'First record'
      'Prior record'
      'Next record'
      'Last record'
      #25554#20837#26032#32426#24405
      #21024#38500
      #20462#25913
      #20445#23384
      #21462#28040#32534#36753
      #21047#26032)
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object ADOQuery1: TADOQuery
    Connection = Dm_Epm.cn_epm
    CursorType = ctStatic
    AfterInsert = ADOQuery1AfterInsert
    Parameters = <>
    SQL.Strings = (
      'select * from corp where Type='#39#35774#35745#39
      '')
    Left = 336
    Top = 152
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 208
    Top = 152
  end
end
