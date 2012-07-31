object Frm_Plan: TFrm_Plan
  Left = 382
  Top = 188
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26045#24037#35745#21010
  ClientHeight = 223
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 6
    Top = 25
    Width = 84
    Height = 14
    Caption = #26045#24037#25215#21253#21830#65306
  end
  object Label3: TLabel
    Left = 9
    Top = 78
    Width = 91
    Height = 14
    Caption = #35745#21010#24320#24037' '#33258#65306
  end
  object Label5: TLabel
    Left = 11
    Top = 116
    Width = 91
    Height = 14
    Caption = #23454#38469#24320#24037' '#33258#65306
  end
  object RzBorder1: TRzBorder
    Left = 15
    Top = 140
    Width = 393
    Height = 8
    BorderSides = [sdBottom]
  end
  object RzBorder2: TRzBorder
    Left = 10
    Top = 55
    Width = 397
    Height = 8
    BorderSides = [sdBottom]
  end
  object Label6: TLabel
    Left = 230
    Top = 116
    Width = 28
    Height = 14
    Caption = #33267#65306
  end
  object Label4: TLabel
    Left = 230
    Top = 78
    Width = 28
    Height = 14
    Caption = #33267#65306
  end
  object Button1: TButton
    Left = 238
    Top = 174
    Width = 61
    Height = 23
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 0
  end
  object Button2: TButton
    Left = 320
    Top = 174
    Width = 61
    Height = 23
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 1
  end
  object cb_sgdw: TComboBox
    Left = 106
    Top = 22
    Width = 268
    Height = 22
    Hint = #35831#36755#20837#25110#36873#25321#26045#24037#25215#21253#21830
    ImeMode = imChinese
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 2
    OnChange = cb_sgdwChange
  end
  object jhkgrq: TRzDateTimeEdit
    Left = 106
    Top = 69
    Width = 118
    Height = 22
    EditType = etDate
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 3
  end
  object sgkgrq: TRzDateTimeEdit
    Left = 106
    Top = 112
    Width = 118
    Height = 22
    EditType = etDate
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 4
  end
  object jhjgrq: TRzDateTimeEdit
    Left = 264
    Top = 69
    Width = 117
    Height = 22
    EditType = etDate
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 5
  end
  object sgjgrq: TRzDateTimeEdit
    Left = 264
    Top = 112
    Width = 117
    Height = 22
    EditType = etDate
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 6
  end
end
