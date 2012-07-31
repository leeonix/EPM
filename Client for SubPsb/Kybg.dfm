object Fram_kybg: TFram_kybg
  Left = 0
  Top = 0
  Width = 545
  Height = 445
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  TabStop = True
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 545
    Height = 445
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    OnChanging = PageControl1Changing
    object TabSheet1: TTabSheet
      Caption = #21487#30740#20449#24687
      object Bevel1: TBevel
        Left = 5
        Top = 300
        Width = 506
        Height = 93
        Shape = bsFrame
      end
      object Bevel3: TBevel
        Left = 5
        Top = 13
        Width = 506
        Height = 274
        Shape = bsFrame
      end
      object Label1: TLabel
        Left = 8
        Top = 34
        Width = 77
        Height = 14
        Caption = ' '#39033#30446#21517#31216#65306
      end
      object Label2: TLabel
        Left = 15
        Top = 63
        Width = 70
        Height = 14
        Caption = #39033#30446#24615#36136#65306
      end
      object Label3: TLabel
        Left = 15
        Top = 125
        Width = 63
        Height = 14
        Caption = #20272#31639#25237#36164':'
      end
      object Label5: TLabel
        Left = 15
        Top = 93
        Width = 70
        Height = 14
        Caption = #39033#30446#20869#23481#65306
      end
      object Label4: TLabel
        Left = 15
        Top = 155
        Width = 70
        Height = 14
        Caption = #24314#35774#21333#20301#65306
      end
      object Label7: TLabel
        Left = 15
        Top = 187
        Width = 70
        Height = 14
        Caption = #35774#35745#21333#20301#65306
      end
      object Label10: TLabel
        Left = 12
        Top = 320
        Width = 98
        Height = 14
        Caption = #25209' '#22797'  '#26085' '#26399#65306
      end
      object Label11: TLabel
        Left = 13
        Top = 357
        Width = 91
        Height = 14
        Caption = #25209' '#22797' '#25991' '#21495#65306
      end
      object Label12: TLabel
        Left = 234
        Top = 357
        Width = 98
        Height = 14
        Caption = #25209#22797#39033#30446#32534#21495#65306
      end
      object Label13: TLabel
        Left = 236
        Top = 126
        Width = 42
        Height = 14
        Caption = '('#19975#20803')'
      end
      object Label14: TLabel
        Left = 16
        Top = 218
        Width = 70
        Height = 14
        Caption = #21487#30740#25253#21578#65306
      end
      object Label8: TLabel
        Left = 8
        Top = 6
        Width = 63
        Height = 14
        Caption = #21487#30740#31616#20917':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 16
        Top = 294
        Width = 63
        Height = 14
        Caption = #21487#30740#25209#22797':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clMaroon
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 17
        Top = 256
        Width = 70
        Height = 14
        Caption = #24320#24037#26085#26399#65306
      end
      object Label15: TLabel
        Left = 225
        Top = 256
        Width = 70
        Height = 14
        Caption = #32467#26463#26085#26399#65306
      end
      object prjname: TcxTextEdit
        Left = 88
        Top = 30
        Style.BorderStyle = ebsUltraFlat
        TabOrder = 0
        Width = 403
      end
      object xzdm: TcxLookupComboBox
        Left = 88
        Top = 59
        Properties.IncrementalFiltering = False
        Properties.KeyFieldNames = 'Code'
        Properties.ListColumns = <
          item
            FieldName = 'Name'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = ds_xzdm
        EditValue = '0'
        TabOrder = 1
        OnEnter = xzdmEnter
        Width = 145
      end
      object primaterial: TcxBlobEdit
        Left = 91
        Top = 87
        Properties.BlobEditKind = bekMemo
        TabOrder = 2
        Width = 406
      end
      object kypfrq: TcxDateEdit
        Left = 104
        Top = 316
        TabOrder = 3
        Width = 164
      end
      object prjaccount: TcxTextEdit
        Left = 328
        Top = 353
        Properties.ReadOnly = False
        Style.BorderStyle = ebsUltraFlat
        TabOrder = 4
        Width = 166
      end
      object pwnumber: TcxHyperLinkEdit
        Left = 104
        Top = 354
        Cursor = crHandPoint
        Properties.ReadOnly = True
        TabOrder = 5
        OnClick = pwnumberClick
        Width = 121
      end
      object Kydoc: TcxHyperLinkEdit
        Left = 88
        Top = 216
        DragCursor = crHandPoint
        ParentShowHint = False
        Properties.ReadOnly = True
        Properties.SingleClick = True
        ShowHint = True
        TabOrder = 6
        OnClick = KydocClick
        Width = 281
      end
      object cxButton1: TcxButton
        Left = 376
        Top = 216
        Width = 89
        Height = 25
        Caption = ' '#24341#20837#25991#26723'...'
        TabOrder = 7
        OnClick = cxButton1Click
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
      end
      object gstz: TcxCalcEdit
        Left = 88
        Top = 121
        EditValue = 0
        TabOrder = 8
        Width = 147
      end
      object Startdate: TcxDateEdit
        Left = 88
        Top = 252
        TabOrder = 9
        Width = 129
      end
      object Enddate: TcxDateEdit
        Left = 296
        Top = 252
        TabOrder = 10
        Width = 129
      end
      object constructby: TcxComboBox
        Left = 88
        Top = 152
        Hint = #24314#35774
        TabOrder = 11
        OnEnter = constructbyEnter
        Width = 289
      end
      object designcorp: TcxComboBox
        Left = 88
        Top = 184
        Hint = #35774#35745
        TabOrder = 12
        OnEnter = constructbyEnter
        Width = 289
      end
    end
  end
  object Adotbl_xzdm: TADOTable
    Connection = Dm_Epm.cn_epm
    CursorType = ctStatic
    TableName = 'XZDM'
    Left = 464
    Top = 88
  end
  object ds_xzdm: TDataSource
    DataSet = Adotbl_xzdm
    Left = 432
    Top = 88
  end
end
