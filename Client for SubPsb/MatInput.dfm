object frm_SelectMat: Tfrm_SelectMat
  Left = 67
  Top = 162
  BorderIcons = [biSystemMenu, biHelp]
  Caption = #24037#31243#26448#26009'__'#36873#25321#26448#26009
  ClientHeight = 582
  ClientWidth = 754
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Scaled = False
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Bevel1: TBevel
    Left = 8
    Top = 16
    Width = 592
    Height = 129
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 16
    Top = 11
    Width = 63
    Height = 14
    Caption = #31579#36873#26465#20214':'
  end
  object Bevel2: TBevel
    Left = 8
    Top = 160
    Width = 592
    Height = 385
    Shape = bsFrame
  end
  object Label2: TLabel
    Left = 16
    Top = 155
    Width = 91
    Height = 14
    Caption = #21487#36873#29992#30340#26448#26009':'
  end
  object Label3: TLabel
    Left = 16
    Top = 76
    Width = 63
    Height = 14
    Caption = #21517'    '#31216':'
  end
  object Label4: TLabel
    Left = 264
    Top = 108
    Width = 63
    Height = 14
    Caption = #22871#26009#20195#30721':'
  end
  object Label5: TLabel
    Left = 264
    Top = 76
    Width = 63
    Height = 14
    Caption = #22411#21495#35268#26684':'
  end
  object Label6: TLabel
    Left = 16
    Top = 44
    Width = 63
    Height = 14
    Caption = #31867'    '#21035':'
  end
  object Label7: TLabel
    Left = 16
    Top = 108
    Width = 63
    Height = 14
    Caption = #35013#32622#22270#21495':'
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 176
    Width = 577
    Height = 361
    DataSource = DataSource1
    ImeName = #20013#25991#20043#26143#26234#33021#29378#25340#8545#26631#20934#29256
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -14
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DrawNo'
        Title.Caption = #22270#21495
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SNCODE'
        Title.Alignment = taCenter
        Title.Caption = #22871#26009'('#29289#36164')'#20195#30721
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Alignment = taCenter
        Title.Caption = #21517#31216
        Width = 161
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPEC'
        Title.Alignment = taCenter
        Title.Caption = #22411#21495#21450#35268#26684
        Width = 170
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Dgsj'
        Title.Caption = #30005#26438#26786#24452
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Gdjl'
        Title.Caption = #23433#35013#20301#32622#33267#26438#39030#36317#31163
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AzWzGj'
        Title.Caption = #23433#35013#20301#32622#26438#24452
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Bz'
        Title.Caption = #22791#27880
        Visible = True
      end>
  end
  object btn_append: TButton
    Left = 608
    Top = 264
    Width = 93
    Height = 29
    Caption = #28155#21152#21040#24037#31243
    TabOrder = 1
    OnClick = btn_appendClick
  end
  object Button2: TButton
    Left = 608
    Top = 312
    Width = 93
    Height = 29
    Caption = #26032#22686'...'
    TabOrder = 2
    OnClick = Button2Click
  end
  object BitBtn1: TBitBtn
    Left = 608
    Top = 160
    Width = 93
    Height = 29
    Caption = #30830#23450
    Default = True
    DoubleBuffered = True
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 608
    Top = 200
    Width = 93
    Height = 29
    Caption = #20851#38381
    DoubleBuffered = True
    Kind = bkCancel
    ParentDoubleBuffered = False
    TabOrder = 4
  end
  object name: TEdit
    Left = 88
    Top = 72
    Width = 145
    Height = 22
    ImeName = #20013#25991#20043#26143#26234#33021#29378#25340#8545#26631#20934#29256
    TabOrder = 5
    OnChange = nameChange
  end
  object spec: TEdit
    Left = 336
    Top = 72
    Width = 169
    Height = 22
    ImeName = #20013#25991#20043#26143#26234#33021#29378#25340#8545#26631#20934#29256
    TabOrder = 6
    OnChange = nameChange
  end
  object sncode: TEdit
    Left = 336
    Top = 104
    Width = 169
    Height = 22
    ImeName = #20013#25991#20043#26143#26234#33021#29378#25340#8545#26631#20934#29256
    TabOrder = 7
    OnChange = nameChange
  end
  object drawno: TEdit
    Left = 88
    Top = 104
    Width = 145
    Height = 22
    ImeName = #20013#25991#20043#26143#26234#33021#29378#25340#8545#26631#20934#29256
    TabOrder = 8
    OnChange = nameChange
  end
  object adoqry_matcode: TADOQuery
    Connection = Dm_Epm.cn_epm
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from material '
      'where 1=1')
    Left = 464
    Top = 248
    object adoqry_matcodeMATID: TAutoIncField
      FieldName = 'MATID'
      ReadOnly = True
    end
    object adoqry_matcodeNAME: TStringField
      FieldName = 'NAME'
      Size = 80
    end
    object adoqry_matcodeLCODE: TStringField
      FieldName = 'LCODE'
      Size = 9
    end
    object adoqry_matcodeSNCODE: TStringField
      FieldName = 'SNCODE'
    end
    object adoqry_matcodeUNIT: TStringField
      FieldName = 'UNIT'
      FixedChar = True
      Size = 8
    end
    object adoqry_matcodeSPEC: TStringField
      DisplayWidth = 120
      FieldName = 'SPEC'
      Size = 100
    end
    object adoqry_matcodePRICE1: TBCDField
      FieldName = 'PRICE1'
      Precision = 18
      Size = 2
    end
    object adoqry_matcodeDrawNo: TStringField
      FieldName = 'DrawNo'
      FixedChar = True
      Size = 6
    end
    object adoqry_matcodeDgsj: TStringField
      FieldName = 'Dgsj'
      FixedChar = True
      Size = 6
    end
    object adoqry_matcodeGdjl: TStringField
      FieldName = 'Gdjl'
      Size = 30
    end
    object adoqry_matcodeAzWzGj: TStringField
      FieldName = 'AzWzGj'
    end
    object adoqry_matcodeBz: TStringField
      FieldName = 'Bz'
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = adoqry_matcode
    Left = 432
    Top = 248
  end
  object Adoqry_type: TADOQuery
    Connection = Dm_Epm.cn_epm
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from mattype')
    Left = 584
    Top = 56
  end
end
