object Frm_NewDoc: TFrm_NewDoc
  Left = 608
  Top = 197
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24037#31243#22270#26723#36164#26009
  ClientHeight = 308
  ClientWidth = 317
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Scaled = False
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 14
  object Button1: TButton
    Left = 168
    Top = 277
    Width = 66
    Height = 26
    Caption = #30830#23450
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 236
    Top = 277
    Width = 67
    Height = 26
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 1
  end
  object PageControl1: TPageControl
    Left = 6
    Top = 6
    Width = 300
    Height = 262
    ActivePage = TabSheet1
    TabIndex = 0
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = #24120#35268
      object Label1: TLabel
        Left = 6
        Top = 12
        Width = 70
        Height = 14
        Caption = #22270#26723#21517#31216#65306
      end
      object Label2: TLabel
        Left = 6
        Top = 72
        Width = 42
        Height = 14
        Caption = #22270#24133#65306
      end
      object Label3: TLabel
        Left = 6
        Top = 103
        Width = 42
        Height = 14
        Caption = #27604#20363#65306
      end
      object Label4: TLabel
        Left = 6
        Top = 134
        Width = 42
        Height = 14
        Caption = #29256#26412#65306
      end
      object Label5: TLabel
        Left = 6
        Top = 165
        Width = 42
        Height = 14
        Caption = #20316#32773#65306
      end
      object Label6: TLabel
        Left = 6
        Top = 196
        Width = 70
        Height = 14
        Caption = #30331#35760#26085#26399#65306
      end
      object Label8: TLabel
        Left = 6
        Top = 40
        Width = 70
        Height = 14
        Caption = #22270#26723#31867#21035#65306
      end
      object DBEdit1: TDBEdit
        Left = 87
        Top = 9
        Width = 188
        Height = 22
        DataField = 'DOCNAME'
        DataSource = Dm_Epm.ds_doc
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        TabOrder = 0
      end
      object DBComboBox1: TDBComboBox
        Left = 87
        Top = 37
        Width = 132
        Height = 22
        DataField = 'DOCTYPE'
        DataSource = Dm_Epm.ds_doc
        ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
        ItemHeight = 14
        Items.Strings = (
          #35774#35745#22270#32440)
        TabOrder = 1
      end
      object DBComboBox2: TDBComboBox
        Left = 87
        Top = 68
        Width = 132
        Height = 22
        DataField = 'LAYOUT'
        DataSource = Dm_Epm.ds_doc
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        ItemHeight = 14
        Items.Strings = (
          'A0'
          'A1'
          'A2'
          'A3'
          'A3+'
          'A4')
        TabOrder = 2
      end
      object DBComboBox3: TDBComboBox
        Left = 87
        Top = 100
        Width = 132
        Height = 22
        DataField = 'SCALE'
        DataSource = Dm_Epm.ds_doc
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        ItemHeight = 14
        Items.Strings = (
          '1:500'
          '1:1000'
          '1:2000')
        TabOrder = 3
      end
      object DBEdit2: TDBEdit
        Left = 87
        Top = 131
        Width = 132
        Height = 22
        DataField = 'VERSION'
        DataSource = Dm_Epm.ds_doc
        Enabled = False
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        TabOrder = 4
      end
      object DBEdit3: TDBEdit
        Left = 87
        Top = 162
        Width = 132
        Height = 22
        DataField = 'CREATEBY'
        DataSource = Dm_Epm.ds_doc
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        TabOrder = 5
      end
      object DBEdit4: TDBEdit
        Left = 87
        Top = 193
        Width = 132
        Height = 22
        DataField = 'CREATEDATE'
        DataSource = Dm_Epm.ds_doc
        Enabled = False
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        TabOrder = 6
      end
    end
  end
end
