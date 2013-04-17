object frm_contractcompany: Tfrm_contractcompany
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = #26045#24037#25215#21253#21830#32500#25252
  ClientHeight = 351
  ClientWidth = 602
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 585
    Height = 281
    DataSource = DataSource1
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #25215#21253#21830#21517#31216
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 215
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Address'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = #21333#20301#22320#22336
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 220
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'XfRate'
        Title.Caption = #32467#31639#28014#21160#29575
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tel'
        Title.Caption = #30005#35805
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fax'
        Title.Caption = #20256#30495
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
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Bankaccount'
        Title.Caption = #36134#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Contactor'
        Title.Caption = #32852#31995#20154
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TaxCode'
        Title.Caption = #31246#21495
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 32
    Top = 318
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
      'select * from corp where AuxFlag='#39'10'#39' or AuxFlag='#39'2'#39
      '')
    Left = 248
    Top = 168
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 144
    Top = 160
  end
end
