object fram_designprj: Tfram_designprj
  Left = 0
  Top = 0
  Width = 501
  Height = 201
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = #23435#20307
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object Label3: TLabel
    Left = 16
    Top = 21
    Width = 75
    Height = 15
    Caption = #24037#31243#24615#36136#65306
  end
  object Label22: TLabel
    Left = 16
    Top = 50
    Width = 77
    Height = 15
    Caption = #24180'    '#24230#65306
  end
  object Label4: TLabel
    Left = 16
    Top = 75
    Width = 75
    Height = 15
    Caption = #24037#31243#21517#31216#65306
  end
  object Label2: TLabel
    Left = 16
    Top = 104
    Width = 75
    Height = 15
    Caption = #24037#31243#24080#21495#65306
  end
  object Label6: TLabel
    Left = 16
    Top = 130
    Width = 75
    Height = 15
    Caption = #35774#35745#21333#20301#65306
  end
  object Bevel3: TBevel
    Left = 5
    Top = 8
    Width = 484
    Height = 177
    Shape = bsFrame
  end
  object Label14: TLabel
    Left = 24
    Top = 2
    Width = 75
    Height = 15
    Caption = #22522#26412#20449#24687#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object PRJTYPE: TComboBox
    Left = 98
    Top = 17
    Width = 121
    Height = 23
    ItemHeight = 15
    TabOrder = 0
    Items.Strings = (
      #20004#32593
      #22522#24314
      #22823#20462
      #25216#25913
      #29992#25913
      #29992#25143#20869#37096)
  end
  object corpcode: TEdit
    Left = 250
    Top = 24
    Width = 87
    Height = 23
    TabOrder = 1
    Text = 'corpcode'
    Visible = False
  end
  object parentcode: TEdit
    Left = 330
    Top = 24
    Width = 79
    Height = 23
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    TabOrder = 2
    Visible = False
  end
  object PLAN_YEAR: TEdit
    Left = 98
    Top = 45
    Width = 121
    Height = 23
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    TabOrder = 3
  end
  object PRJNAME: TEdit
    Left = 98
    Top = 72
    Width = 369
    Height = 23
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    TabOrder = 4
  end
  object PRJACCOUNT: TEdit
    Left = 98
    Top = 100
    Width = 369
    Height = 23
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    TabOrder = 5
  end
  object DESIGNCOMPANY: TComboBox
    Left = 98
    Top = 129
    Width = 372
    Height = 23
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    ItemHeight = 15
    TabOrder = 6
    OnEnter = DESIGNCOMPANYEnter
  end
end
