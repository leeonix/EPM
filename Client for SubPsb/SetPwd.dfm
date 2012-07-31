object Frm_ModPwd: TFrm_ModPwd
  Left = 429
  Top = 232
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsSingle
  Caption = #35774#32622#21475#20196
  ClientHeight = 152
  ClientWidth = 285
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 14
  object Label2: TLabel
    Left = 15
    Top = 20
    Width = 56
    Height = 14
    Caption = #26032#21475#20196#65306
  end
  object Label3: TLabel
    Left = 15
    Top = 68
    Width = 84
    Height = 14
    Caption = #30830#35748#26032#21475#20196#65306
  end
  object EDT_NEWPWD: TEdit
    Left = 112
    Top = 16
    Width = 153
    Height = 22
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    PasswordChar = '*'
    TabOrder = 0
  end
  object Button1: TButton
    Left = 104
    Top = 112
    Width = 78
    Height = 28
    Caption = #30830#23450
    TabOrder = 2
    OnClick = Button1Click
    OnKeyPress = FormKeyPress
  end
  object Button2: TButton
    Left = 192
    Top = 112
    Width = 78
    Height = 28
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 3
  end
  object edt_pwdconfirm: TEdit
    Left = 112
    Top = 64
    Width = 153
    Height = 22
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    PasswordChar = '*'
    TabOrder = 1
  end
end
