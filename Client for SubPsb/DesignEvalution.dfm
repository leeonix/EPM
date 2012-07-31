object Fram_DesignEva: TFram_DesignEva
  Left = 0
  Top = 0
  Width = 540
  Height = 263
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = #23435#20307
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 540
    Height = 28
    Align = alTop
    BevelOuter = bvNone
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 7
      Top = 4
      Width = 105
      Height = 14
      Caption = #39033#30446#32771#35780#28165#21333#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 4
      Top = 21
      Width = 531
      Height = 3
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 231
    Width = 540
    Height = 32
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    object StaticText1: TStaticText
      Left = 8
      Top = 4
      Width = 519
      Height = 27
      AutoSize = False
      Caption = #35774#35745#23460#20027#20219#25353#19987#19994#31867#21035#20998#21035#24405#20837#35774#35745#32771#35780#31995#25968#65292#31995#32479#23558#33258#21160#35745#31639#35813#39033#30446#30340#26631#20934#32771#35780#20998#20540#65292#35774#35745#23460#20027#20219#20063#21487#20197#25163#21160#20462#25913#32771#35780#31995#25968#21644#20998#20540#12290
      Font.Charset = GB2312_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 28
    Width = 540
    Height = 203
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 540
      Height = 163
      Align = alClient
      DataSource = Dm_Epm.ds_bud
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -15
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'BUDITEM'
          Title.Alignment = taCenter
          Width = 91
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BUDFEE'
          Title.Alignment = taCenter
          Width = 134
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FEENUM'
          Title.Alignment = taCenter
          Width = 152
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ITEM_K1'
          Title.Alignment = taCenter
          Width = 110
          Visible = True
        end>
    end
    object Panel4: TPanel
      Left = 0
      Top = 163
      Width = 540
      Height = 40
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 1
      object Label3: TLabel
        Left = 193
        Top = 13
        Width = 75
        Height = 15
        Caption = #32771#35780#20998#20540#65306
      end
      object Label2: TLabel
        Left = 8
        Top = 13
        Width = 61
        Height = 15
        Caption = 'K2'#31995#25968#65306
      end
      object SpeedButton1: TSpeedButton
        Left = 389
        Top = 9
        Width = 36
        Height = 23
        Hint = #35745#31639
        Caption = #35745#31639
        Flat = True
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton1Click
      end
      object SpeedButton2: TSpeedButton
        Left = 435
        Top = 9
        Width = 37
        Height = 23
        Hint = #20445#23384
        Caption = #20445#23384
        Flat = True
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton2Click
      end
      object Edt_fz: TEdit
        Left = 268
        Top = 9
        Width = 118
        Height = 23
        ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
        TabOrder = 0
      end
      object Edt_k2: TEdit
        Left = 64
        Top = 9
        Width = 104
        Height = 23
        ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
        TabOrder = 1
      end
    end
  end
end
