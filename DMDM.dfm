object SM: TSM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 347
  Width = 587
  object ConDataSnap: TSQLConnection
    ConnectionName = 'DataSnapCONNECTION'
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXDataSnap'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=17.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'DriverName=DataSnap'
      'HostName=localhost'
      'Port=211'
      'CommunicationProtocol=tcp/ip')
    Left = 40
    Top = 32
    UniqueId = '{330DD28B-2BEB-40F9-9203-287D3C066110}'
  end
  object DSProviderConnection1: TDSProviderConnection
    ServerClassName = 'TDB'
    SQLConnection = ConDataSnap
    Left = 160
    Top = 32
  end
  object DSProviderConnection2: TDSProviderConnection
    ServerClassName = 'TDM'
    SQLConnection = ConDataSnap
    Left = 160
    Top = 96
  end
end
