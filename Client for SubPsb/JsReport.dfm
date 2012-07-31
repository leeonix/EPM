object frm_jsreport: Tfrm_jsreport
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #24037#31243#32467#31639#32479#35745#25253#34920
  ClientHeight = 662
  ClientWidth = 807
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 0
    Width = 807
    Height = 662
    ActivePage = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    OnChange = RzPageControl1Change
    FixedDimension = 23
    object TabSheet1: TRzTabSheet
      Caption = #24037#31243#32467#31639#32479#35745#26376#25253
      object RzPanel2: TRzPanel
        Left = 0
        Top = 0
        Width = 803
        Height = 73
        Align = alTop
        BorderOuter = fsNone
        TabOrder = 0
        object Label10: TLabel
          Left = 25
          Top = 23
          Width = 88
          Height = 17
          Caption = #32467#31639#26085#26399' '#33258#65306
        end
        object Bevel1: TBevel
          Left = 8
          Top = 61
          Width = 786
          Height = 2
        end
        object Label11: TLabel
          Left = 294
          Top = 23
          Width = 28
          Height = 17
          Caption = #33267#65306
        end
        object startdate: TRzDateTimeEdit
          Left = 128
          Top = 20
          Width = 144
          Height = 25
          EditType = etDate
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          TabOrder = 0
        end
        object enddate: TRzDateTimeEdit
          Left = 336
          Top = 20
          Width = 137
          Height = 25
          EditType = etDate
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          TabOrder = 1
        end
      end
      object RzDBGrid1: TRzDBGrid
        Left = 0
        Top = 73
        Width = 803
        Height = 512
        Align = alClient
        DataSource = DataSource1
        DefaultDrawing = True
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -14
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object RzPanel1: TRzPanel
        Left = 0
        Top = 585
        Width = 803
        Height = 50
        Align = alBottom
        BorderOuter = fsNone
        TabOrder = 2
        object BitBtn1: TBitBtn
          Left = 544
          Top = 6
          Width = 125
          Height = 35
          Caption = #23548#20986#21040'excel'
          Default = True
          DoubleBuffered = True
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333330000333333333333333333333333F33333333333
            00003333344333333333333333388F3333333333000033334224333333333333
            338338F3333333330000333422224333333333333833338F3333333300003342
            222224333333333383333338F3333333000034222A22224333333338F338F333
            8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
            33333338F83338F338F33333000033A33333A222433333338333338F338F3333
            0000333333333A222433333333333338F338F33300003333333333A222433333
            333333338F338F33000033333333333A222433333333333338F338F300003333
            33333333A222433333333333338F338F00003333333333333A22433333333333
            3338F38F000033333333333333A223333333333333338F830000333333333333
            333A333333333333333338330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
          ParentDoubleBuffered = False
          TabOrder = 0
          OnClick = BitBtn1Click
        end
        object BitBtn2: TBitBtn
          Left = 675
          Top = 6
          Width = 70
          Height = 35
          Caption = #36864#20986
          DoubleBuffered = True
          Kind = bkCancel
          ParentDoubleBuffered = False
          TabOrder = 1
        end
        object RzButton1: TRzButton
          Left = 432
          Top = 6
          Width = 106
          Height = 35
          Caption = #26597#25214#32479#35745
          TabOrder = 2
          OnClick = RzButton1Click
        end
      end
    end
    object TabSheet2: TRzTabSheet
      Caption = #24037#31243#32467#28165#24773#20917#26376#25253
      object RzPanel5: TRzPanel
        Left = 0
        Top = 0
        Width = 803
        Height = 73
        Align = alTop
        BorderOuter = fsNone
        TabOrder = 0
        object Label3: TLabel
          Left = 25
          Top = 23
          Width = 88
          Height = 17
          Caption = #32467#31639#26085#26399' '#33258#65306
        end
        object Bevel3: TBevel
          Left = 8
          Top = 61
          Width = 786
          Height = 2
        end
        object Label4: TLabel
          Left = 294
          Top = 23
          Width = 28
          Height = 17
          Caption = #33267#65306
        end
        object startdate2: TRzDateTimeEdit
          Left = 119
          Top = 20
          Width = 144
          Height = 25
          EditType = etDate
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          TabOrder = 0
        end
        object enddate2: TRzDateTimeEdit
          Left = 336
          Top = 20
          Width = 137
          Height = 25
          EditType = etDate
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          TabOrder = 1
        end
      end
      object RzPanel6: TRzPanel
        Left = 0
        Top = 585
        Width = 803
        Height = 50
        Align = alBottom
        BorderOuter = fsNone
        TabOrder = 1
        object BitBtn5: TBitBtn
          Left = 544
          Top = 6
          Width = 125
          Height = 35
          Caption = #23548#20986#21040'excel'
          Default = True
          DoubleBuffered = True
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333330000333333333333333333333333F33333333333
            00003333344333333333333333388F3333333333000033334224333333333333
            338338F3333333330000333422224333333333333833338F3333333300003342
            222224333333333383333338F3333333000034222A22224333333338F338F333
            8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
            33333338F83338F338F33333000033A33333A222433333338333338F338F3333
            0000333333333A222433333333333338F338F33300003333333333A222433333
            333333338F338F33000033333333333A222433333333333338F338F300003333
            33333333A222433333333333338F338F00003333333333333A22433333333333
            3338F38F000033333333333333A223333333333333338F830000333333333333
            333A333333333333333338330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
          ParentDoubleBuffered = False
          TabOrder = 0
          OnClick = BitBtn5Click
        end
        object BitBtn6: TBitBtn
          Left = 675
          Top = 6
          Width = 70
          Height = 35
          Caption = #36864#20986
          DoubleBuffered = True
          Kind = bkCancel
          ParentDoubleBuffered = False
          TabOrder = 1
        end
        object RzButton3: TRzButton
          Left = 432
          Top = 6
          Width = 106
          Height = 35
          Caption = #26597#25214#32479#35745
          TabOrder = 2
          OnClick = RzButton3Click
        end
      end
      object RzDBGrid3: TRzDBGrid
        Left = 0
        Top = 73
        Width = 803
        Height = 512
        Align = alClient
        DataSource = ds_jq
        DefaultDrawing = True
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -14
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object TabSheet3: TRzTabSheet
      Caption = #25215#21457#21253#21512#21516#24773#20917#32479#35745
      object RzPanel3: TRzPanel
        Left = 0
        Top = 0
        Width = 803
        Height = 73
        Align = alTop
        BorderOuter = fsNone
        TabOrder = 0
        object Label1: TLabel
          Left = 25
          Top = 23
          Width = 88
          Height = 17
          Caption = #32467#31639#26085#26399' '#33258#65306
        end
        object Bevel2: TBevel
          Left = 8
          Top = 61
          Width = 786
          Height = 2
        end
        object Label2: TLabel
          Left = 294
          Top = 23
          Width = 28
          Height = 17
          Caption = #33267#65306
        end
        object RzDateTimeEdit1: TRzDateTimeEdit
          Left = 128
          Top = 20
          Width = 144
          Height = 25
          EditType = etDate
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          TabOrder = 0
        end
        object RzDateTimeEdit2: TRzDateTimeEdit
          Left = 336
          Top = 20
          Width = 137
          Height = 25
          EditType = etDate
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          TabOrder = 1
        end
      end
      object RzDBGrid2: TRzDBGrid
        Left = 0
        Top = 73
        Width = 803
        Height = 512
        Align = alClient
        DataSource = DataSource2
        DefaultDrawing = True
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -14
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object RzPanel4: TRzPanel
        Left = 0
        Top = 585
        Width = 803
        Height = 50
        Align = alBottom
        BorderOuter = fsNone
        TabOrder = 2
        object BitBtn3: TBitBtn
          Left = 544
          Top = 6
          Width = 125
          Height = 35
          Caption = #23548#20986#21040'excel'
          Default = True
          DoubleBuffered = True
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333330000333333333333333333333333F33333333333
            00003333344333333333333333388F3333333333000033334224333333333333
            338338F3333333330000333422224333333333333833338F3333333300003342
            222224333333333383333338F3333333000034222A22224333333338F338F333
            8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
            33333338F83338F338F33333000033A33333A222433333338333338F338F3333
            0000333333333A222433333333333338F338F33300003333333333A222433333
            333333338F338F33000033333333333A222433333333333338F338F300003333
            33333333A222433333333333338F338F00003333333333333A22433333333333
            3338F38F000033333333333333A223333333333333338F830000333333333333
            333A333333333333333338330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
          ParentDoubleBuffered = False
          TabOrder = 0
          OnClick = BitBtn3Click
        end
        object BitBtn4: TBitBtn
          Left = 675
          Top = 6
          Width = 70
          Height = 35
          Caption = #36864#20986
          DoubleBuffered = True
          Kind = bkCancel
          ParentDoubleBuffered = False
          TabOrder = 1
        end
        object RzButton2: TRzButton
          Left = 432
          Top = 6
          Width = 106
          Height = 35
          Caption = #26597#25214#32479#35745
          TabOrder = 2
          OnClick = RzButton2Click
        end
      end
    end
    object TabSheet4: TRzTabSheet
      Caption = #24037#31243#32467#20313#24773#20917#20998#26512#32479#35745
    end
  end
  object ADOQuery1: TADOQuery
    Connection = Dm_Epm.cn_epm
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT TypeName,  PRJACCOUNT,PRJNAME,Htje,Sgdw,SsPrice,SjPrice,'#39 +
        #39' as Sjcompany,Jsrq'
      
        'FROM dbo.ARRANGE INNER JOIN dbo.PROJECTINFO ON dbo.ARRANGE.PrjCo' +
        'de = dbo.PROJECTINFO.PRJCODE'
      
        'INNER JOIN dbo.PROJECTTYPE ON dbo.PROJECTINFO.PRJTYPE = dbo.PROJ' +
        'ECTTYPE.PRJTYPECODE'
      
        'INNER JOIN dbo.ProjectSj ON dbo.PROJECTINFO.PRJCODE = dbo.Projec' +
        'tSj.PrjCode')
    Left = 520
    Top = 32
    object ADOQuery1TypeName: TStringField
      DisplayLabel = #24037#31243#24615#36136
      FieldName = 'TypeName'
    end
    object ADOQuery1PRJACCOUNT: TStringField
      DisplayLabel = #24037#31243#36134#21495
      FieldName = 'PRJACCOUNT'
      Size = 40
    end
    object ADOQuery1PRJNAME: TStringField
      DisplayLabel = #24037#31243#21517#31216
      FieldName = 'PRJNAME'
      Size = 60
    end
    object ADOQuery1Htje: TStringField
      DisplayLabel = #21512#21516#37329#39069
      FieldName = 'Htje'
      Size = 10
    end
    object ADOQuery1Sgdw: TStringField
      DisplayLabel = #26045#24037#21333#20301
      FieldName = 'Sgdw'
      Size = 40
    end
    object ADOQuery1SsPrice: TIntegerField
      DisplayLabel = #36865#23457#20215
      FieldName = 'SsPrice'
    end
    object ADOQuery1SjPrice: TIntegerField
      DisplayLabel = #23457#23450#20215
      FieldName = 'SjPrice'
    end
    object ADOQuery1Sjcompany: TStringField
      DisplayLabel = #23457#20215#21333#20301
      FieldName = 'Sjcompany'
      ReadOnly = True
      Size = 1
    end
    object ADOQuery1Jsrq: TDateTimeField
      DisplayLabel = #32467#31639#26085#26399
      FieldName = 'Jsrq'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 640
    Top = 48
  end
  object ADOQuery2: TADOQuery
    Connection = Dm_Epm.cn_epm
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT PRJACCOUNT,PRJNAME, '#39#24066#21335#20379#30005#20844#21496#39' AS constructby,DYDJ,TYPENAME' +
        ',sghtbh AS htbh,Sgdw AS htyf,'#39#26045#24037#21512#21516#39' AS httype,Htje,SjPrice AS js' +
        'je'
      
        'FROM dbo.PROJECTINFO a INNER JOIN dbo.ARRANGE ON  a.PRJCODE = AR' +
        'RANGE.PrjCode'
      'INNER JOIN dbo.PROJECTTYPE ON  PRJTYPE= PRJTYPECODE'
      'LEFT JOIN dbo.ProjectSj b ON a.PRJCODE= b.Prjcode'
      'WHERE PrintDate BETWEEN '#39'2012-01-01'#39' AND '#39'2012-06-30'#39)
    Left = 664
    Top = 136
    object ADOQuery2PRJACCOUNT: TStringField
      DisplayLabel = #24037#31243#36134#21495
      FieldName = 'PRJACCOUNT'
      Size = 40
    end
    object ADOQuery2PRJNAME: TStringField
      DisplayLabel = #24037#31243#21517#31216
      FieldName = 'PRJNAME'
      Size = 60
    end
    object ADOQuery2constructby: TStringField
      DisplayLabel = #24314#35774#21333#20301
      FieldName = 'constructby'
      ReadOnly = True
      Size = 12
    end
    object ADOQuery2DYDJ: TStringField
      DisplayLabel = #30005#21387#31561#32423
      FieldName = 'DYDJ'
    end
    object ADOQuery2TYPENAME: TStringField
      DisplayLabel = #39033#30446#31867#22411
      FieldName = 'TYPENAME'
    end
    object ADOQuery2htyf: TStringField
      DisplayLabel = #21512#21516#25215#21253#26041
      FieldName = 'htyf'
      Size = 40
    end
    object ADOQuery2httype: TStringField
      DisplayLabel = #21512#21516#31867#22411
      FieldName = 'httype'
      ReadOnly = True
      Size = 8
    end
    object ADOQuery2Htje: TStringField
      DisplayLabel = #21512#21516#37329#39069
      FieldName = 'Htje'
      Size = 10
    end
    object ADOQuery2jsje: TIntegerField
      DisplayLabel = #32467#31639#37329#39069
      FieldName = 'jsje'
    end
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 712
    Top = 160
  end
  object MyReport1: TMyReport
    Reporttitle = #19978#28023#26216#36745#31185#25216'Excel'#36755#20986
    Col = 2
    prefixchar = '@'
    reporttype = rtreport
    dataset = ADOQuery2
    Left = 728
    Top = 72
  end
  object ds_jq: TDataSource
    DataSet = qry_Jq
    Left = 344
    Top = 304
  end
  object qry_Jq: TADOQuery
    Connection = Dm_Epm.cn_epm
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'DECLARE'#9'@return_value int'
      'EXEC'#9'@return_value = [dbo].[GetJSByErpcode]'
      #9#9'@Begindate = N'#39'2011-01-01'#39','
      #9#9'@Enddate = N'#39'2012-04-01'#39
      ''
      '')
    Left = 440
    Top = 304
    object qry_JqTYPENAME: TStringField
      DisplayLabel = #24037#31243#24615#36136
      FieldName = 'TYPENAME'
    end
    object qry_Jqerpcode: TStringField
      DisplayLabel = 'Erp'#36134#21495
      FieldName = 'erpcode'
      Size = 24
    end
    object qry_JqPrjname: TStringField
      DisplayLabel = #24037#31243#21517#31216
      FieldName = 'Prjname'
      ReadOnly = True
      Size = 60
    end
    object qry_Jqsumfee: TIntegerField
      DisplayLabel = #39044#31639#24635#36153#29992
      FieldName = 'sumfee'
      ReadOnly = True
    end
    object qry_Jqsjprice: TIntegerField
      DisplayLabel = #26045#24037#32467#31639#24635#39069
      FieldName = 'sjprice'
      ReadOnly = True
    end
    object qry_Jqjyfee: TIntegerField
      DisplayLabel = #32467#20313#36153#29992
      FieldKind = fkCalculated
      FieldName = 'jyfee'
      Calculated = True
    end
    object qry_Jqjsrq: TDateTimeField
      DisplayLabel = #32467#31639#26085#26399
      FieldName = 'jsrq'
      ReadOnly = True
    end
  end
end
