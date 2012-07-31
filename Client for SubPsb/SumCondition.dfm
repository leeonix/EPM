object frm_sumcondition: Tfrm_sumcondition
  Left = 389
  Top = 161
  Width = 338
  Height = 368
  Caption = #36873#25321#32479#35745#26465#20214
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
    Left = 16
    Top = 24
    Width = 305
    Height = 211
    Shape = bsFrame
  end
  object Label4: TLabel
    Left = 24
    Top = 16
    Width = 70
    Height = 14
    Caption = #31579#36873#26465#20214#65306
  end
  object Label1: TLabel
    Left = 98
    Top = 162
    Width = 14
    Height = 14
    Caption = #20174
  end
  object Label2: TLabel
    Left = 98
    Top = 202
    Width = 14
    Height = 14
    Caption = #21040
  end
  object RadioGroup1: TRadioGroup
    Left = 16
    Top = 241
    Width = 305
    Height = 49
    Caption = #31867#22411
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #24403#21069#36229#21608#26399
      #25152#26377#36229#21608#26399)
    TabOrder = 7
  end
  object Cb_depart: TComboBox
    Left = 120
    Top = 45
    Width = 145
    Height = 22
    Enabled = False
    ItemHeight = 14
    TabOrder = 0
  end
  object cb_employee: TComboBox
    Left = 120
    Top = 120
    Width = 145
    Height = 22
    Enabled = False
    ItemHeight = 14
    TabOrder = 1
    OnEnter = cb_employeeEnter
  end
  object BitBtn1: TBitBtn
    Left = 96
    Top = 297
    Width = 91
    Height = 28
    Caption = #30830#23450
    TabOrder = 2
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 224
    Top = 297
    Width = 91
    Height = 28
    Caption = #21462#28040
    TabOrder = 3
    Kind = bkCancel
  end
  object CheckBox1: TCheckBox
    Left = 30
    Top = 48
    Width = 65
    Height = 17
    Caption = #37096#38376#65306
    TabOrder = 4
    OnClick = CheckBox1Click
  end
  object CheckBox2: TCheckBox
    Left = 30
    Top = 123
    Width = 57
    Height = 17
    Caption = #20154#21592#65306
    TabOrder = 5
    OnClick = CheckBox2Click
  end
  object CheckBox3: TCheckBox
    Left = 30
    Top = 160
    Width = 57
    Height = 17
    Caption = #26085#26399':'
    TabOrder = 6
    OnClick = CheckBox3Click
  end
  object dtp_begin: TDateTimePicker
    Left = 120
    Top = 160
    Width = 145
    Height = 22
    CalAlignment = dtaLeft
    Date = 37704.6000626968
    Time = 37704.6000626968
    DateFormat = dfShort
    DateMode = dmComboBox
    Enabled = False
    Kind = dtkDate
    ParseInput = False
    TabOrder = 8
  end
  object dtp_end: TDateTimePicker
    Left = 120
    Top = 200
    Width = 145
    Height = 22
    CalAlignment = dtaLeft
    Date = 37704.6000626968
    Time = 37704.6000626968
    DateFormat = dfShort
    DateMode = dmComboBox
    Enabled = False
    Kind = dtkDate
    ParseInput = False
    TabOrder = 9
  end
  object cb_type: TComboBox
    Left = 120
    Top = 85
    Width = 145
    Height = 22
    Enabled = False
    ItemHeight = 14
    TabOrder = 10
  end
  object CheckBox4: TCheckBox
    Left = 30
    Top = 88
    Width = 65
    Height = 17
    Caption = #24615#36136#65306
    TabOrder = 11
    OnClick = CheckBox4Click
  end
end
