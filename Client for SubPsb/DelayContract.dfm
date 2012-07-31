object frm_DelayContract: Tfrm_DelayContract
  Left = 0
  Top = 0
  Caption = #26045#24037#21608#26399#36229#36807#21512#21516#30340#24037#31243#39033#30446
  ClientHeight = 482
  ClientWidth = 738
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 738
    Height = 424
    Align = alClient
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = Ds_Delaycontractprj
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid1DBTableView1PRJACCOUNT: TcxGridDBColumn
        Caption = #24037#31243#36134#21495
        DataBinding.FieldName = 'PRJACCOUNT'
        Width = 152
      end
      object cxGrid1DBTableView1PRJNAME: TcxGridDBColumn
        Caption = #24037#31243#21517#31216
        DataBinding.FieldName = 'PRJNAME'
        Width = 255
      end
      object cxGrid1DBTableView1Sgdw: TcxGridDBColumn
        Caption = #26045#24037#25215#21253#21830
        DataBinding.FieldName = 'Sgdw'
        Width = 169
      end
      object cxGrid1DBTableView1JHJGRQ: TcxGridDBColumn
        Caption = #21512#21516#31459#24037#26085#26399
        DataBinding.FieldName = 'JHJGRQ'
        Width = 113
      end
      object cxGrid1DBTableView1Sgjgrq: TcxGridDBColumn
        Caption = #23454#38469#31459#24037#26085#26399
        DataBinding.FieldName = 'Sgjgrq'
        Width = 104
      end
      object cxGrid1DBTableView1outdate: TcxGridDBColumn
        Caption = #30446#21069#36229#26399#22825#25968
        DataBinding.FieldName = 'outdate'
      end
      object cxGrid1DBTableView1DelayStart: TcxGridDBColumn
        Caption = #24310#26399#24320#24037#26085#26399
        DataBinding.FieldName = 'DelayStart'
        Width = 114
      end
      object cxGrid1DBTableView1DelayEnd: TcxGridDBColumn
        Caption = #24310#26399#31459#24037#26085#26399
        DataBinding.FieldName = 'DelayEnd'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 424
    Width = 738
    Height = 58
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 1
    object Button1: TButton
      Left = 568
      Top = 20
      Width = 121
      Height = 34
      Caption = #25171#21360#24310#26399#21512#21516
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object Adoqry_Delaycontractprj: TADOQuery
    Connection = Dm_Epm.cn_epm
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        ' SELECT  XMDM, PRJACCOUNT,PRJNAME,JHJGRQ,C.Sgjgrq, C.Sgdw,D.Addr' +
        'ess,'
      
        '         DATEDIFF(day,JHJGRQ,GetDate()) as outdate, C.DelayStart' +
        ',C.DelayEnd'
      
        ' FROM FLOWNODEINFO A INNER JOIN PROJECTINFO B ON A.XMDM = B.PRJC' +
        'ODE'
      '            INNER JOIN  Arrange C ON B.PRJCODE = C.PRJCODE '
      '            Inner join Corp D On D.Name=C.Sgdw                 '
      
        ' WHERE CorpCode=2 AND  ACTIVEFLAG = 1  AND (FLAG<>1 AND FLAG<>4 ' +
        ' and flag<>2)'
      '               AND Jhjgrq>'#39'2011-1-31'#39' '
      '               AND ((Sgjgrq  IS NULL  and Jhjgrq<GETDATE())) ')
    Left = 544
    Top = 176
    object Adoqry_DelaycontractprjXMDM: TStringField
      FieldName = 'XMDM'
      FixedChar = True
      Size = 13
    end
    object Adoqry_DelaycontractprjPRJACCOUNT: TStringField
      FieldName = 'PRJACCOUNT'
      Size = 40
    end
    object Adoqry_DelaycontractprjPRJNAME: TStringField
      FieldName = 'PRJNAME'
      Size = 60
    end
    object Adoqry_DelaycontractprjJHJGRQ: TDateTimeField
      FieldName = 'JHJGRQ'
    end
    object Adoqry_Delaycontractprjoutdate: TIntegerField
      FieldName = 'outdate'
      ReadOnly = True
    end
    object Adoqry_DelaycontractprjSgjgrq: TDateTimeField
      FieldName = 'Sgjgrq'
    end
    object Adoqry_DelaycontractprjSgdw: TStringField
      FieldName = 'Sgdw'
      Size = 40
    end
    object Adoqry_DelaycontractprjAddress: TWideStringField
      FieldName = 'Address'
      Size = 100
    end
    object Adoqry_DelaycontractprjDelayStart: TDateTimeField
      FieldName = 'DelayStart'
    end
    object Adoqry_DelaycontractprjDelayEnd: TDateTimeField
      FieldName = 'DelayEnd'
    end
  end
  object Ds_Delaycontractprj: TDataSource
    DataSet = Adoqry_Delaycontractprj
    Left = 576
    Top = 176
  end
  object MyReport1: TMyReport
    Reporttitle = #19978#28023#26216#36745#31185#25216'Excel'#36755#20986
    prefixchar = '@'
    reporttype = rtcard
    Left = 78
    Top = 424
  end
  object PopupMenu1: TPopupMenu
    Left = 352
    Top = 136
    object N1: TMenuItem
      Caption = #25171#21360#24310#26399#21512#21516
      OnClick = N1Click
    end
  end
end
