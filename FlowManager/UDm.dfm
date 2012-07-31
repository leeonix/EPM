object Dm_flow: TDm_flow
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 219
  Width = 223
  object Adc_flow: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=shinan;Persist Security Info=True;U' +
      'ser ID=sa;Initial Catalog=epm;Data Source=gm-note;Use Procedure ' +
      'for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation I' +
      'D=AMBERY;Use Encryption for Data=False;Tag with column collation' +
      ' when possible=False'
    ConnectionTimeout = 45
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 16
  end
  object Dspcom: TDataSetProvider
    DataSet = Adqry_com
    Left = 24
    Top = 88
  end
  object Adqry_com: TADOQuery
    Connection = Adc_flow
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tasknode ')
    Left = 112
    Top = 24
  end
  object Adqry_pub: TADOQuery
    Connection = Adc_flow
    Parameters = <>
    Left = 104
    Top = 88
  end
end
