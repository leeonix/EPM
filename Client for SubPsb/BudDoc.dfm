object Frm_buddoc: TFrm_buddoc
  Left = 366
  Top = 215
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsSingle
  Caption = #39044#31639#20070
  ClientHeight = 174
  ClientWidth = 248
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 14
  object Label8: TLabel
    Left = 12
    Top = 18
    Width = 84
    Height = 14
    Caption = #39044#31639#20070#31867#21035#65306
  end
  object Label4: TLabel
    Left = 12
    Top = 46
    Width = 42
    Height = 14
    Caption = #29256#26412#65306
  end
  object Label5: TLabel
    Left = 12
    Top = 77
    Width = 42
    Height = 14
    Caption = #20316#32773#65306
  end
  object Label6: TLabel
    Left = 12
    Top = 108
    Width = 70
    Height = 14
    Caption = #30331#35760#26085#26399#65306
  end
  object Button1: TButton
    Left = 75
    Top = 142
    Width = 75
    Height = 28
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 0
  end
  object Button2: TButton
    Left = 155
    Top = 142
    Width = 75
    Height = 28
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 1
  end
  object Cb_budtype: TComboBox
    Left = 93
    Top = 15
    Width = 132
    Height = 22
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    ItemHeight = 14
    TabOrder = 2
    Items.Strings = (
      #39640#21387#32447#36335
      #20302#21387#32447#36335
      #39640#21387#30005#32518
      #20302#21387#30005#32518
      #21464#30005#39044#31639#20070
      #22303#24314#39044#31639#20070
      #36890#20449#39044#31639#20070)
  end
  object Edt_version: TEdit
    Left = 93
    Top = 44
    Width = 132
    Height = 22
    Enabled = False
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    TabOrder = 3
  end
  object Edt_author: TEdit
    Left = 93
    Top = 75
    Width = 132
    Height = 22
    Enabled = False
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    TabOrder = 4
  end
  object Edt_createdate: TEdit
    Left = 93
    Top = 106
    Width = 132
    Height = 22
    Enabled = False
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    TabOrder = 5
  end
end
