object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 276
  Width = 336
  object ADOconn: TADOConnection
    BeforeConnect = ADOconnBeforeConnect
    Left = 80
    Top = 16
  end
end
