object frm_setpara: Tfrm_setpara
  Left = 315
  Top = 135
  BorderStyle = bsSingle
  Caption = #33410#28857#31649#29702#65293#20195#30721#32500#25252
  ClientHeight = 469
  ClientWidth = 483
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object Bevel1: TBevel
    Left = 8
    Top = 16
    Width = 465
    Height = 441
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 98
    Height = 14
    Caption = #21442#25968#20195#30721#32500#25252#65306
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 40
    Width = 449
    Height = 369
    DataSource = DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -14
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PARACODE'
        Title.Caption = #20195#30721#32534#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PARATYPE'
        Title.Caption = #20195#30721#31867#21035
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PARANAME'
        Title.Caption = #20195#30721#21517#31216
        Width = 192
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USEDNUM'
        Title.Caption = #20351#29992#39057#29575
        Visible = True
      end
      item
        Expanded = False
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 24
    Top = 424
    Width = 440
    Height = 25
    DataSource = DataSource1
    TabOrder = 1
  end
  object ADOTable1: TADOTable
    Active = True
    Connection = Dm_Epm.cn_epm
    CursorType = ctStatic
    IndexFieldNames = 'paratype;paracode'
    TableName = 'PARAM'
    Left = 240
    Top = 128
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 176
    Top = 112
  end
end
