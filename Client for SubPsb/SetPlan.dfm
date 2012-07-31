object Frm_SetPlan: TFrm_SetPlan
  Left = 450
  Top = 181
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24037#31243#33410#28857#35745#21010
  ClientHeight = 210
  ClientWidth = 290
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 6
    Top = 22
    Width = 70
    Height = 14
    Caption = #33410#28857#21517#31216#65306
  end
  object Label2: TLabel
    Left = 6
    Top = 53
    Width = 98
    Height = 14
    Caption = #35745#21010#24320#22987#26085#26399#65306
  end
  object Label3: TLabel
    Left = 6
    Top = 84
    Width = 98
    Height = 14
    Caption = #35745#21010#32467#26463#26085#26399#65306
  end
  object Label4: TLabel
    Left = 6
    Top = 115
    Width = 98
    Height = 14
    Caption = #24037#26399'('#24037#20316#26085')'#65306
  end
  object edt_nodename: TEdit
    Left = 112
    Top = 19
    Width = 163
    Height = 22
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    TabOrder = 0
    Text = 'Edt_nodename'
  end
  object Button1: TButton
    Left = 118
    Top = 168
    Width = 63
    Height = 24
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 199
    Top = 168
    Width = 63
    Height = 24
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
  object dtp_start: TDateTimePicker
    Left = 112
    Top = 50
    Width = 145
    Height = 22
    CalAlignment = dtaLeft
    Date = 37226.5523988889
    Time = 37226.5523988889
    DateFormat = dfShort
    DateMode = dmComboBox
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    Kind = dtkDate
    ParseInput = False
    TabOrder = 3
    OnChange = dtp_startChange
  end
  object dtp_end: TDateTimePicker
    Left = 112
    Top = 81
    Width = 145
    Height = 22
    CalAlignment = dtaLeft
    Date = 37226.5524428241
    Time = 37226.5524428241
    DateFormat = dfShort
    DateMode = dmComboBox
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    Kind = dtkDate
    ParseInput = False
    TabOrder = 4
  end
  object SpinEdit1: TSpinEdit
    Left = 112
    Top = 112
    Width = 75
    Height = 23
    MaxValue = 0
    MinValue = 0
    TabOrder = 5
    Value = 0
    OnChange = SpinEdit1Change
  end
end
