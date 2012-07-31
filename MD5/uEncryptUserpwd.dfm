object Form3: TForm3
  Left = 287
  Top = 162
  Width = 707
  Height = 521
  Caption = #29992#25143#23494#30721#21152#23494
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 24
    Top = 440
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 649
    Height = 417
    DataSource = DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object cn_epm: TADOConnection
    CommandTimeout = 40
    ConnectionTimeout = 30
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 408
    Top = 256
  end
  object ADOQuery1: TADOQuery
    Connection = cn_epm
    Parameters = <>
    SQL.Strings = (
      'select employeename,jobcode,password, corpcode'
      'from employee')
    Left = 304
    Top = 256
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 200
    Top = 256
  end
end
