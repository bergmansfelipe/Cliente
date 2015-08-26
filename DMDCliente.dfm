object DMCliente: TDMCliente
  OldCreateOrder = False
  Height = 264
  Width = 407
  object cdsBanco: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBanco'
    RemoteServer = SM.DSProviderConnection1
    Left = 56
    Top = 24
  end
  object dsBanco: TDataSource
    DataSet = cdsBanco
    Left = 136
    Top = 24
  end
  object cdsMoeda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMoeda'
    RemoteServer = SM.DSProviderConnection2
    Left = 56
    Top = 80
  end
  object dsMoeda: TDataSource
    DataSet = cdsMoeda
    Left = 136
    Top = 80
  end
end
