object Dm_Epm: TDm_Epm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 391
  Width = 546
  object cn_epm: TADOConnection
    CommandTimeout = 40
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=shinan;Persist Security Info=True;U' +
      'ser ID=sa;Initial Catalog=epm;Data Source=gm-note;Use Procedure ' +
      'for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation I' +
      'D=TUZZ;Use Encryption for Data=False;Tag with column collation w' +
      'hen possible=False'
    ConnectionTimeout = 30
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 56
    Top = 64
  end
  object adoqry_pub: TADOQuery
    Connection = cn_epm
    CursorType = ctStatic
    ParamCheck = False
    Parameters = <>
    Left = 244
    Top = 56
  end
  object adoqry_input: TADOQuery
    Connection = cn_epm
    Parameters = <>
    Left = 216
    Top = 224
  end
  object qry_gettime: TADOQuery
    Connection = cn_epm
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select getdate() as currentdate')
    Left = 176
    Top = 56
  end
  object opendlg: TOpenDialog
    Filter = #25152#26377#25991#20214'(*.*)|*.*|CAD'#25991#20214'(*.dwg,*.dwf)|*.dwg'
    InitialDir = 'C:\'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 32
    Top = 288
  end
  object ADOQry_doc: TADOQuery
    Connection = cn_epm
    CursorType = ctStatic
    AfterInsert = ADOQry_docAfterInsert
    OnCalcFields = ADOQry_docCalcFields
    Parameters = <
      item
        Name = 'mycode'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 13
        Value = Null
      end
      item
        Name = 'doctype'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    SQL.Strings = (
      'select * from DOCINFO'
      'where SSXMDM=:mycode'
      'and doctype=:doctype')
    Left = 112
    Top = 144
    object ADOQry_docSSXMDM: TStringField
      FieldName = 'SSXMDM'
      FixedChar = True
      Size = 13
    end
    object ADOQry_docDOCCODE: TAutoIncField
      FieldName = 'DOCCODE'
      ReadOnly = True
    end
    object ADOQry_docDOCNAME: TStringField
      FieldName = 'DOCNAME'
      Size = 100
    end
    object ADOQry_docDOCTYPE: TStringField
      FieldName = 'DOCTYPE'
    end
    object ADOQry_docCREATEBY: TStringField
      FieldName = 'CREATEBY'
      FixedChar = True
      Size = 8
    end
    object ADOQry_docFILETYPE: TStringField
      FieldName = 'FILETYPE'
      Size = 10
    end
    object ADOQry_docLAYOUT: TStringField
      FieldName = 'LAYOUT'
      FixedChar = True
      Size = 2
    end
    object ADOQry_docSCALE: TStringField
      FieldName = 'SCALE'
      Size = 10
    end
    object ADOQry_docFILENAME: TStringField
      FieldName = 'FILENAME'
      Size = 255
    end
    object ADOQry_docVERSION: TStringField
      FieldName = 'VERSION'
      FixedChar = True
      Size = 1
    end
    object ADOQry_docREMARK: TMemoField
      FieldName = 'REMARK'
      BlobType = ftMemo
    end
    object ADOQry_docCREATEDATE: TDateTimeField
      FieldName = 'CREATEDATE'
    end
    object ADOQry_docid: TStringField
      DisplayLabel = #24207#21495
      FieldKind = fkCalculated
      FieldName = 'id'
      Calculated = True
    end
  end
  object ds_doc: TDataSource
    DataSet = ADOQry_doc
    Left = 200
    Top = 296
  end
  object adoqry_plan: TADOQuery
    Connection = cn_epm
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'mycode'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 13
        Value = Null
      end>
    SQL.Strings = (
      'select * from ARRANGE  '
      'where prjcode=:mycode')
    Left = 120
    Top = 64
    object adoqry_planSGDW: TStringField
      DisplayLabel = #26045#24037#21333#20301
      FieldName = 'SGDW'
      Size = 40
    end
    object adoqry_planJHKGRQ: TDateTimeField
      DisplayLabel = #35745#21010#24320#24037#26085#26399
      FieldName = 'JHKGRQ'
      DisplayFormat = 'yyyy'#39#24180#39'mm'#39#26376#39'dd '#39#26085#39
    end
    object adoqry_planJHJGRQ: TDateTimeField
      DisplayLabel = #35745#21010#31459#24037#26085#26399
      FieldName = 'JHJGRQ'
      DisplayFormat = 'yyyy'#39#24180#39'mm'#39#26376#39'dd '#39#26085#39
    end
    object adoqry_planSGLB: TStringField
      DisplayLabel = #26045#24037#20869#23481
      FieldName = 'SGLB'
    end
    object adoqry_planSGKGRQ: TDateTimeField
      DisplayLabel = #23454#38469#24320#24037#26085#26399
      FieldName = 'SGKGRQ'
      DisplayFormat = 'yyyy'#39#24180#39'mm'#39#26376#39'dd '#39#26085#39
    end
    object adoqry_planSGJGRQ: TDateTimeField
      DisplayLabel = #23454#38469#31459#24037#26085#26399
      FieldName = 'SGJGRQ'
      DisplayFormat = 'yyyy'#39#24180#39'mm'#39#26376#39'dd '#39#26085#39
    end
    object adoqry_planJLF: TStringField
      FieldName = 'JLF'
      Size = 10
    end
    object adoqry_planHTJE: TStringField
      FieldName = 'HTJE'
      Size = 10
    end
    object adoqry_planPrintDate: TDateTimeField
      FieldName = 'PrintDate'
    end
    object adoqry_planPRJCODE: TStringField
      FieldName = 'PRJCODE'
      FixedChar = True
      Size = 13
    end
    object adoqry_planP_SGDW: TStringField
      DisplayLabel = #26045#24037#21333#20301
      FieldName = 'P_SGDW'
      Size = 50
    end
    object adoqry_planSBF: TStringField
      FieldName = 'SBF'
      Size = 10
    end
    object adoqry_planAccCorpcode: TStringField
      FieldName = 'AccCorpcode'
      Size = 10
    end
  end
  object ds_plan: TDataSource
    DataSet = adoqry_plan
    Left = 224
    Top = 152
  end
  object adoqry_rep: TADOQuery
    Connection = cn_epm
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 328
    Top = 64
  end
  object adoqry_bud: TADOQuery
    Connection = cn_epm
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'mycode'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 13
        Value = Null
      end>
    SQL.Strings = (
      'select * from budget a,designcost b'
      'where a.prjcode=b.prjcode and a.prjcode=:mycode'
      '     and a.buditem=b.feeitem')
    Left = 32
    Top = 224
    object adoqry_budPRJCODE: TStringField
      FieldName = 'PRJCODE'
      FixedChar = True
      Size = 13
    end
    object adoqry_budBUDITEM: TStringField
      DisplayLabel = #39044#31639#31867#21035
      FieldName = 'BUDITEM'
      FixedChar = True
      Size = 14
    end
    object adoqry_budBUDFEE: TBCDField
      DisplayLabel = #39044#31639#36153#29992
      FieldName = 'BUDFEE'
      Precision = 11
      Size = 2
    end
    object adoqry_budFEENUM: TBCDField
      DisplayLabel = #35774#35745#36153#29992
      FieldName = 'FEENUM'
      Precision = 10
      Size = 2
    end
    object adoqry_budITEM_K1: TBCDField
      DisplayLabel = #35780#20998#31995#25968'K1'
      FieldName = 'ITEM_K1'
      Precision = 3
      Size = 2
    end
    object adoqry_budBudgetId: TAutoIncField
      FieldName = 'BudgetId'
      ReadOnly = True
    end
    object adoqry_budSjFee: TBCDField
      FieldName = 'SjFee'
      Precision = 18
      Size = 2
    end
  end
  object ds_bud: TDataSource
    DataSet = adoqry_bud
    Left = 352
    Top = 288
  end
  object ADOQry_Nameplate: TADOQuery
    Connection = cn_nameplate
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 416
    Top = 240
    object ADOQry_NameplateExpr1: TStringField
      DisplayLabel = #30005#21387#31561#32423
      FieldName = 'Expr1'
      Size = 30
    end
    object ADOQry_NameplateEx3EmploName: TStringField
      DisplayLabel = #30003#35831#20154
      FieldName = 'Ex3EmploName'
      Size = 16
    end
    object ADOQry_NameplateEx1StateName: TStringField
      DisplayLabel = #30003#35831#29366#24577
      FieldName = 'Ex1StateName'
      Size = 50
    end
    object ADOQry_NameplateEx2Ratifier: TStringField
      DisplayLabel = #23457#25209#20154
      FieldName = 'Ex2Ratifier'
      Size = 16
    end
    object ADOQry_NameplateNPTextR: TStringField
      DisplayLabel = #38125#29260#20840#25991
      FieldName = 'NPTextR'
      Size = 80
    end
    object ADOQry_NameplateOldNPTextR: TStringField
      DisplayLabel = #26087#38125#29260#20840#25991
      FieldName = 'OldNPTextR'
      Size = 80
    end
    object ADOQry_NameplateOldNPNOR: TStringField
      DisplayLabel = #26087#38125#29260#32534#21495
      FieldName = 'OldNPNOR'
      Size = 30
    end
    object ADOQry_NameplateOldNPNameR: TStringField
      DisplayLabel = #26087#38125#29260#21517#31216
      FieldName = 'OldNPNameR'
      Size = 50
    end
    object ADOQry_NameplateNPNameR: TStringField
      DisplayLabel = #38125#29260#21517#31216
      FieldName = 'NPNameR'
      Size = 50
    end
    object ADOQry_NameplateNPNOR: TStringField
      DisplayLabel = #38125#29260#32534#21495
      FieldName = 'NPNOR'
      Size = 30
    end
    object ADOQry_NameplateDispatcher: TStringField
      DisplayLabel = #25191#34892#20154
      FieldName = 'Dispatcher'
      Size = 8
    end
    object ADOQry_NameplateLocusElecStaR: TStringField
      DisplayLabel = #25152#23646#21464#37197#30005#31449
      FieldName = 'LocusElecStaR'
      Size = 50
    end
    object ADOQry_NameplateLocusCircuitryR: TStringField
      DisplayLabel = #30005#32518
      FieldName = 'LocusCircuitryR'
      Size = 50
    end
    object ADOQry_NameplateArchiver: TStringField
      DisplayLabel = #24402#26723#20154
      FieldName = 'Archiver'
      Size = 8
    end
  end
  object DS_NamePlate: TDataSource
    DataSet = ADOQry_Nameplate
    Left = 424
    Top = 184
  end
  object ADOQry_export: TADOQuery
    Connection = cn_epm
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select * from projectinfo inner join flownodeinfo on prjcode=xmd' +
        'm '
      'inner join projecttype on prjtype=PRJTYPECODE  '
      'left join designinfo on projectinfo.prjcode=designinfo.prjcode'
      'LEFT JOIN budget on projectinfo.prjcode=budget.prjcode '
      'where 1=2')
    Left = 112
    Top = 224
    object ADOQry_exportTYPENAME: TStringField
      DisplayLabel = #24037#31243#24615#36136
      FieldName = 'TYPENAME'
    end
    object ADOQry_exportPRJNAME: TStringField
      DisplayLabel = #24037#31243#21517#31216
      FieldName = 'PRJNAME'
      Size = 60
    end
    object ADOQry_exportPRJACCOUNT: TStringField
      DisplayLabel = #24037#31243#24080#21495
      FieldName = 'PRJACCOUNT'
      Size = 40
    end
    object ADOQry_exportCONSTRUCTBY: TStringField
      DisplayLabel = #24314#35774#21333#20301
      FieldName = 'CONSTRUCTBY'
      Size = 40
    end
    object ADOQry_exportDESIGNCOMPANY: TStringField
      DisplayLabel = #35774#35745#21333#20301
      FieldName = 'DESIGNCOMPANY'
      Size = 40
    end
    object ADOQry_exportOTHERTYPE: TStringField
      DisplayLabel = #24037#31243#31867#21035
      FieldName = 'OTHERTYPE'
    end
    object ADOQry_exportYHMC: TStringField
      DisplayLabel = #29992#25143#21517#31216
      FieldName = 'YHMC'
      Size = 50
    end
    object ADOQry_exportLXR: TStringField
      DisplayLabel = #32852#31995#20154
      FieldName = 'LXR'
      FixedChar = True
      Size = 8
    end
    object ADOQry_exportLXDH: TStringField
      DisplayLabel = #32852#31995#22320#22336
      FieldName = 'LXDH'
    end
    object ADOQry_exportYYSFJE: TStringField
      DisplayLabel = #33829#19994#25910#36153#37329#39069
      FieldName = 'YYSFJE'
      Size = 10
    end
    object ADOQry_exportYYSFRQ: TDateTimeField
      DisplayLabel = #33829#19994#25910#36153#26085#26399
      FieldName = 'YYSFRQ'
    end
    object ADOQry_exportPFWJWH: TStringField
      DisplayLabel = #25209#22797#25991#20214#25991#21495
      FieldName = 'PFWJWH'
      Size = 30
    end
    object ADOQry_exportKYSBRQ: TDateTimeField
      DisplayLabel = #21487#30740#30003#25253#26085#26399
      FieldName = 'KYSBRQ'
    end
    object ADOQry_exportKYPFRQ: TDateTimeField
      DisplayLabel = #21487#30740#25209#22797#26085#26399
      FieldName = 'KYPFRQ'
    end
    object ADOQry_exportKYSBBM: TStringField
      DisplayLabel = #21487#30740#30003#25253#37096#38376
      FieldName = 'KYSBBM'
    end
    object ADOQry_exportDYDJ: TStringField
      DisplayLabel = #30005#21387#31561#32423
      FieldName = 'DYDJ'
    end
    object ADOQry_exportZJRL: TStringField
      DisplayLabel = #35013#25509#23481#37327
      FieldName = 'ZJRL'
      Size = 10
    end
    object ADOQry_exportZJPFWH: TStringField
      DisplayLabel = #36164#37329#25209#22797#25991#21495
      FieldName = 'ZJPFWH'
      Size = 30
    end
    object ADOQry_exportYSSBRQ: TDateTimeField
      DisplayLabel = #21021#35774#39044#31639#19978#25253#26085#26399
      FieldName = 'YSSBRQ'
    end
    object ADOQry_exportZJPFRQ: TDateTimeField
      DisplayLabel = #36164#37329#25209#22797#26085#26399
      FieldName = 'ZJPFRQ'
    end
    object ADOQry_exportGSTZ: TStringField
      DisplayLabel = #27010#31639#25237#36164
      FieldName = 'GSTZ'
      Size = 8
    end
    object ADOQry_exportPRIMMATERIAL: TMemoField
      DisplayLabel = #24037#31243#35268#27169
      FieldName = 'PRIMMATERIAL'
      BlobType = ftMemo
    end
    object ADOQry_exportPRJADD: TStringField
      DisplayLabel = #24037#31243#22320#22336
      FieldName = 'PRJADD'
      Size = 50
    end
    object ADOQry_exportSLYYY: TStringField
      DisplayLabel = #21463#29702#33829#19994#21592
      FieldName = 'SLYYY'
      FixedChar = True
      Size = 8
    end
    object ADOQry_exportNODENAME: TStringField
      DisplayLabel = #24403#21069#33410#28857
      FieldName = 'NODENAME'
      Size = 30
    end
    object ADOQry_exportEXECUTOR: TStringField
      DisplayLabel = #24403#21069#25191#34892#20154
      FieldName = 'EXECUTOR'
      FixedChar = True
      Size = 8
    end
    object ADOQry_exportDESIGNBY: TStringField
      DisplayLabel = #35774#35745#20154
      FieldName = 'DESIGNBY'
      FixedChar = True
      Size = 8
    end
    object ADOQry_exportCHECKBY: TStringField
      DisplayLabel = #26657#23545#20154
      FieldName = 'CHECKBY'
      FixedChar = True
      Size = 8
    end
    object ADOQry_exportBUDGETBY: TStringField
      DisplayLabel = #39044#31639#20154
      FieldName = 'BUDGETBY'
      FixedChar = True
      Size = 8
    end
    object ADOQry_exportBUDCHECKBY: TStringField
      DisplayLabel = #39044#31639#23457#26680
      FieldName = 'BUDCHECKBY'
      FixedChar = True
      Size = 8
    end
    object ADOQry_exportAPPROVBY: TStringField
      DisplayLabel = #35774#35745#25209#20934
      FieldName = 'APPROVBY'
      FixedChar = True
      Size = 8
    end
    object ADOQry_exportSENDDOCBY: TStringField
      DisplayLabel = #36865#22270#20154
      FieldName = 'SENDDOCBY'
      FixedChar = True
      Size = 8
    end
    object ADOQry_exportDESIGNDATE: TDateTimeField
      DisplayLabel = #35774#35745#23436#25104#26085#26399
      FieldName = 'DESIGNDATE'
    end
    object ADOQry_exportCHECKDATE: TDateTimeField
      DisplayLabel = #26657#23545#26085#26399
      FieldName = 'CHECKDATE'
    end
    object ADOQry_exportBUDDATE: TDateTimeField
      DisplayLabel = #39044#31639#26085#26399
      FieldName = 'BUDDATE'
    end
    object ADOQry_exportAPPROVDATE: TDateTimeField
      DisplayLabel = #35774#35745#25209#20934#26085#26399
      FieldName = 'APPROVDATE'
    end
    object ADOQry_exportSENDDOCDATE: TDateTimeField
      DisplayLabel = #36865#22270#26085#26399
      FieldName = 'SENDDOCDATE'
    end
    object ADOQry_exportRECIEVEDATE: TDateTimeField
      DisplayLabel = #35774#35745#20219#21153#21040#36798#26085#26399
      FieldName = 'RECIEVEDATE'
    end
    object ADOQry_exportBudFee: TBCDField
      DisplayLabel = #39044#31639#36896#20215
      FieldName = 'BudFee'
      Precision = 11
      Size = 2
    end
  end
  object cn_nameplate: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=mhpower;Persist Security Info=True;' +
      'User ID=sa;Initial Catalog=nameplate;Data Source=SJSDBS2'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 288
    Top = 288
  end
  object adoqry_com: TADOQuery
    Connection = cn_epm
    Parameters = <>
    Left = 104
    Top = 288
  end
end
