object Fram_Execontract: TFram_Execontract
  Left = 0
  Top = 0
  Width = 554
  Height = 242
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 554
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 6
      Width = 105
      Height = 14
      Caption = #26045#24037#21512#21516#28165#21333#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 4
      Top = 24
      Width = 533
      Height = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 207
    Width = 554
    Height = 35
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    object StaticText1: TStaticText
      Left = 8
      Top = 5
      Width = 536
      Height = 27
      AutoSize = False
      Caption = 
        #24037#31243#31649#29702#31185#21512#21516#21592#26681#25454#35745#21010#21592#23433#25490#30340#24037#31243#26045#24037#25215#21253#21333#20301#21644#20869#23481#24182#21442#29031#23545#24212#30340#39044#31639#20070#65292#25353#29031#21015#34920#36880#39033#24405#20837#21512#21516#37329#39069#21644#24037#31243#30417#29702#36153#12290#31995#32479#23558#29983#25104#26412#24037#31243 +
        #30340#26045#24037#21512#21516#12289#24320#24037#25253#21578#12289#23433#20840#21327#35758#20197#20415#25171#21360#36755#20986#12290
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 30
    Width = 554
    Height = 177
    Align = alClient
    DataSource = Dm_Epm.ds_plan
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    ParentFont = False
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid2DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'sghtbh'
        Title.Caption = #26045#24037#21512#21516#32534#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SGDW'
        Title.Alignment = taCenter
        Title.Caption = #26045#24037#25215#21253#21830
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HTJE'
        Title.Alignment = taCenter
        Title.Caption = #26045#24037#21512#21516#37329#39069
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'prepayment'
        Title.Caption = #39044#20184#27454'(%)'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JLF'
        Title.Alignment = taCenter
        Title.Caption = #25991#26126#25514#26045#36153
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'jlhtbh'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Jlfee'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Jldw'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Chf'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'chhtbh'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PrintDate'
        Title.Alignment = taCenter
        Title.Caption = #21512#21516#31614#35746#26085#26399
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DelayStart'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DelayEnd'
        Visible = True
      end>
  end
  object PopupMenu1: TPopupMenu
    Left = 296
    Top = 120
    object N1: TMenuItem
      Caption = #21512#21516#24405#20837
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #25171#21360#21512#21516#12289#21327#35758
      OnClick = N2Click
    end
  end
end
