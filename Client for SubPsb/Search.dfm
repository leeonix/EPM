object frm_search: Tfrm_search
  Left = 275
  Top = 168
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #25628#32034#24037#31243#39033#30446
  ClientHeight = 341
  ClientWidth = 561
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  Scaled = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  object btn_find: TButton
    Left = 468
    Top = 66
    Width = 87
    Height = 28
    Caption = #24320#22987#26597#25214
    TabOrder = 0
    OnClick = btn_findClick
  end
  object btn_clearcondition: TButton
    Left = 468
    Top = 114
    Width = 87
    Height = 28
    Caption = #28165#38500#26465#20214
    TabOrder = 1
    OnClick = btn_clearconditionClick
  end
  object btn_close: TButton
    Left = 468
    Top = 202
    Width = 87
    Height = 28
    Caption = #20851#38381
    TabOrder = 2
    OnClick = btn_closeClick
  end
  object PageControl1: TPageControl
    Left = 9
    Top = 8
    Width = 449
    Height = 321
    ActivePage = TabSheet1
    TabIndex = 0
    TabOrder = 3
    object TabSheet1: TTabSheet
      Caption = #26597#35810#26465#20214
      object Label1: TLabel
        Left = 274
        Top = 46
        Width = 14
        Height = 14
        Caption = #21644
      end
      object Label2: TLabel
        Left = 256
        Top = 15
        Width = 35
        Height = 14
        Caption = #20171#20110':'
      end
      object Label3: TLabel
        Left = 256
        Top = 85
        Width = 28
        Height = 14
        Caption = #31561#20110
      end
      object CheckBox1: TCheckBox
        Left = 17
        Top = 13
        Width = 73
        Height = 17
        Caption = #26085#26399#65306
        TabOrder = 0
        OnClick = CheckBox1Click
      end
      object Datefield: TComboBox
        Left = 104
        Top = 11
        Width = 137
        Height = 22
        Enabled = False
        ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
        ItemHeight = 14
        TabOrder = 1
      end
      object dtp_begin: TDateTimePicker
        Left = 295
        Top = 11
        Width = 139
        Height = 22
        CalAlignment = dtaLeft
        Date = 0.454176793980878
        Time = 0.454176793980878
        DateFormat = dfShort
        DateMode = dmComboBox
        Enabled = False
        ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
        Kind = dtkDate
        ParseInput = False
        TabOrder = 2
      end
      object dtp_end: TDateTimePicker
        Left = 295
        Top = 43
        Width = 139
        Height = 22
        CalAlignment = dtaLeft
        Date = 37440.454176794
        Time = 37440.454176794
        DateFormat = dfShort
        DateMode = dmComboBox
        Enabled = False
        ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
        Kind = dtkDate
        ParseInput = False
        TabOrder = 3
      end
      object CheckBox2: TCheckBox
        Left = 17
        Top = 81
        Width = 65
        Height = 17
        Caption = #20154#21592#65306
        TabOrder = 4
        OnClick = CheckBox2Click
      end
      object CheckBox3: TCheckBox
        Left = 17
        Top = 112
        Width = 81
        Height = 25
        Caption = #39033#30446#20869#23481#65306
        TabOrder = 5
        OnClick = CheckBox3Click
      end
      object employee: TComboBox
        Left = 104
        Top = 81
        Width = 137
        Height = 22
        Enabled = False
        ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
        ItemHeight = 14
        TabOrder = 6
      end
      object cbx_employee: TComboBox
        Left = 296
        Top = 81
        Width = 137
        Height = 22
        Enabled = False
        ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
        ItemHeight = 14
        TabOrder = 7
        OnEnter = cbx_employeeEnter
      end
      object prjcontent: TComboBox
        Left = 105
        Top = 135
        Width = 97
        Height = 22
        Enabled = False
        ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
        ItemHeight = 14
        TabOrder = 8
      end
      object cbx_simbol: TComboBox
        Left = 224
        Top = 135
        Width = 97
        Height = 22
        Enabled = False
        ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
        ItemHeight = 14
        TabOrder = 9
        Items.Strings = (
          #31561#20110
          #21253#21547)
      end
      object edt_content: TEdit
        Left = 336
        Top = 135
        Width = 97
        Height = 22
        Enabled = False
        ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
        TabOrder = 10
        OnKeyDown = edt_contentKeyDown
      end
      object Lb_condition: TListBox
        Left = 104
        Top = 164
        Width = 233
        Height = 114
        Enabled = False
        ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
        ItemHeight = 14
        TabOrder = 11
      end
      object btn_add: TButton
        Left = 344
        Top = 168
        Width = 90
        Height = 25
        Caption = #28155#21152
        Enabled = False
        TabOrder = 12
        OnClick = btn_addClick
      end
      object btn_delete: TButton
        Left = 344
        Top = 208
        Width = 90
        Height = 25
        Caption = #21024#38500
        Enabled = False
        TabOrder = 13
        OnClick = btn_deleteClick
      end
    end
  end
  object btn_export: TButton
    Left = 468
    Top = 158
    Width = 87
    Height = 28
    Caption = #36755#20986#32467#26524'...'
    TabOrder = 4
    OnClick = btn_exportClick
  end
end
