object Fram_Prjplan: TFram_Prjplan
  Left = 0
  Top = 0
  Width = 543
  Height = 240
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
    Width = 543
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 6
      Width = 105
      Height = 14
      Caption = #39033#30446#23454#26045#23433#25490#65306
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
    Top = 205
    Width = 543
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
        #24037#31243#35745#21010#21592#26681#25454#24037#31243#20855#20307#24773#20917#23558#24037#31243#25353#26045#24037#19987#19994#21457#21253#33267#21508#26045#24037#25215#21253#21333#20301#65292#21046#23450#24037#31243#23454#26045#30340#21021#27493#26102#38388#35745#21010#65292#24403#24037#31243#31459#24037#21518#24212#21450#26102#30331#35760#21508#19987#19994#26045#24037#20869#23481 +
        #30340#23454#38469#24320#24037#21644#23454#38469#31459#24037#26085#26399#12290
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 30
    Width = 543
    Height = 175
    Align = alClient
    DataSource = Dm_Epm.ds_plan
    ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
    PopupMenu = Frm_PrjDesign.PopupMenu1
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -14
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SGDW'
        Title.Alignment = taCenter
        Title.Caption = #26045#24037#25215#21253#21830
        Width = 117
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'JHKGRQ'
        Title.Alignment = taCenter
        Width = 92
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'JHJGRQ'
        Title.Alignment = taCenter
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SGKGRQ'
        Title.Alignment = taCenter
        Width = 104
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SGJGRQ'
        Title.Alignment = taCenter
        Width = 115
        Visible = True
      end>
  end
end
