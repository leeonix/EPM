object frm_DateRange: Tfrm_DateRange
  Left = 0
  Top = 0
  Caption = #24310#26399#21512#21516#26102#38480#35774#32622
  ClientHeight = 173
  ClientWidth = 363
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
    Left = 48
    Top = 27
    Width = 65
    Height = 16
    Caption = #24320#24037#26085#26399':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object RzLabel2: TRzLabel
    Left = 48
    Top = 83
    Width = 65
    Height = 16
    Caption = #31459#24037#26085#26399':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object startdate: TRzDateTimeEdit
    Left = 152
    Top = 24
    Width = 177
    Height = 24
    EditType = etDate
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ParentFont = False
    TabOrder = 0
  end
  object enddate: TRzDateTimeEdit
    Left = 152
    Top = 80
    Width = 177
    Height = 24
    EditType = etDate
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ParentFont = False
    TabOrder = 1
  end
  object RzButton1: TRzButton
    Left = 80
    Top = 136
    Width = 97
    Height = 29
    ModalResult = 1
    Caption = #30830#23450
    TabOrder = 2
  end
  object RzButton2: TRzButton
    Left = 232
    Top = 136
    Width = 97
    Height = 29
    ModalResult = 2
    Caption = #21462#28040
    TabOrder = 3
  end
end
