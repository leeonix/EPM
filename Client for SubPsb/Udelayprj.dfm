object frm_Delayprj: Tfrm_Delayprj
  Left = 256
  Top = 150
  Caption = #36229#21608#26399#24037#31243
  ClientHeight = 426
  ClientWidth = 601
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 601
    Height = 426
    Align = alClient
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = Ds_Delayprj
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid1DBTableView1PRJNAME: TcxGridDBColumn
        Caption = #24037#31243#21517#31216
        DataBinding.FieldName = 'PRJNAME'
        Options.ShowEditButtons = isebNever
        Width = 271
      end
      object cxGrid1DBTableView1PRJACCOUNT: TcxGridDBColumn
        Caption = #24037#31243#24080#21495
        DataBinding.FieldName = 'PRJACCOUNT'
        Options.Editing = False
        Options.ShowEditButtons = isebNever
        Width = 156
      end
      object cxGrid1DBTableView1NODENAME: TcxGridDBColumn
        Caption = #24403#21069#33410#28857
        DataBinding.FieldName = 'NODENAME'
        Options.Editing = False
        Options.ShowEditButtons = isebNever
        Width = 86
      end
      object cxGrid1DBTableView1TYPENAME: TcxGridDBColumn
        Caption = #24037#31243#24615#36136
        DataBinding.FieldName = 'TYPENAME'
        Options.Editing = False
        Options.ShowEditButtons = isebNever
        Width = 77
      end
      object cxGrid1DBTableView1NodeStart: TcxGridDBColumn
        Caption = #24320#22987#26085#26399
        DataBinding.FieldName = 'NodeStart'
        Options.Editing = False
        Options.ShowEditButtons = isebNever
        Width = 84
      end
      object cxGrid1DBTableView1PLANEND: TcxGridDBColumn
        Caption = #23436#25104#26399#38480
        DataBinding.FieldName = 'PLANEND'
        Options.Editing = False
        Options.ShowEditButtons = isebNever
        Width = 82
      end
      object cxGrid1DBTableView1Delayreason: TcxGridDBColumn
        Caption = #36229#26399#21407#22240
        DataBinding.FieldName = 'Delayreason'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = False
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object Ds_Delayprj: TDataSource
    DataSet = Adoqry_Delayprj
    Left = 440
    Top = 64
  end
  object Adoqry_Delayprj: TADOQuery
    Connection = Dm_Epm.cn_epm
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'LoginUser'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 8
        Value = Null
      end>
    SQL.Strings = (
      
        ' SELECT NODENAME,NodeStart,dbo.GetFinishDay(NODESTART,SETDATE) A' +
        'S PLANEND,'
      '  XMDM, PRJACCOUNT,Delayreason,PRJNAME,TYPENAME'
      ''
      
        ' FROM FLOWNODEINFO A INNER JOIN PROJECTINFO B ON A.XMDM = B.PRJC' +
        'ODE'
      '            INNER JOIN  PROJECTTYPE C ON B.PRJTYPE=C.PRJTYPECODE'
      '            INNER JOIN  TASKNODE D ON A.NODECODE=D.TASKCODE'
      ' WHERE ACTIVEFLAG = 1 AND  Executor=:LoginUser '
      
        '       AND FLAG<>1 AND FLAG<>4  and flag<>2 and nodename<>'#39#22996#25176#35774#35745#39 +
        ' and Iscaculated='#39'0'#39
      '       and dbo.GetFinishDay(NODESTART,SETDATE)<Getdate()')
    Left = 408
    Top = 64
    object Adoqry_DelayprjPRJNAME: TStringField
      FieldName = 'PRJNAME'
      Size = 60
    end
    object Adoqry_DelayprjPRJACCOUNT: TStringField
      FieldName = 'PRJACCOUNT'
      Size = 40
    end
    object Adoqry_DelayprjNODENAME: TStringField
      FieldName = 'NODENAME'
      Size = 30
    end
    object Adoqry_DelayprjTYPENAME: TStringField
      FieldName = 'TYPENAME'
    end
    object Adoqry_DelayprjNodeStart: TDateTimeField
      FieldName = 'NodeStart'
    end
    object Adoqry_DelayprjPLANEND: TDateTimeField
      FieldName = 'PLANEND'
      ReadOnly = True
    end
    object Adoqry_DelayprjDelayreason: TStringField
      FieldName = 'Delayreason'
      Size = 80
    end
    object Adoqry_DelayprjXMDM: TStringField
      FieldName = 'XMDM'
      FixedChar = True
      Size = 13
    end
  end
end
