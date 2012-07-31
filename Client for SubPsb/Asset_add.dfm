object Frm_AddAssets: TFrm_AddAssets
  Left = 438
  Top = 285
  BorderStyle = bsDialog
  Caption = #30331#35760#22266#23450#36164#20135#26126#32454#34920
  ClientHeight = 160
  ClientWidth = 255
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 6
    Top = 16
    Width = 98
    Height = 14
    Caption = #36164#20135#26126#32454#31867#21035#65306
  end
  object Label2: TLabel
    Left = 6
    Top = 48
    Width = 56
    Height = 14
    Caption = #22635#25253#20154#65306
  end
  object Label3: TLabel
    Left = 6
    Top = 80
    Width = 70
    Height = 14
    Caption = #22635#25253#26085#26399#65306
  end
  object cb_type: TComboBox
    Left = 106
    Top = 13
    Width = 141
    Height = 22
    ItemHeight = 14
    TabOrder = 0
    Items.Strings = (
      #37197#30005#36164#20135#26126#32454
      #32447#36335#36164#20135#26126#32454
      #21464#30005#36164#20135#26126#32454
      #21464#21387#22120#26126#32454
      #25286#38500#35774#22791#26126#32454
      #19981#38656#23433#35013#26126#32454
      #20854#20182#36164#20135#26126#32454)
  end
  object edt_tbr: TEdit
    Left = 106
    Top = 45
    Width = 140
    Height = 22
    ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
    TabOrder = 1
  end
  object edt_tbrq: TEdit
    Left = 106
    Top = 77
    Width = 140
    Height = 22
    ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
    TabOrder = 2
  end
  object Button1: TButton
    Left = 96
    Top = 126
    Width = 66
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 166
    Top = 126
    Width = 67
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
end
