unit DMDM;

interface

uses
  System.SysUtils, System.Classes, Data.DBXDataSnap, IPPeerClient,
  Data.DBXCommon, Datasnap.DBClient, Datasnap.DSConnect, Data.DB, Data.SqlExpr,
  Unit1;

type
  TSM = class(TDataModule)
    ConDataSnap: TSQLConnection;
    DSProviderConnection1: TDSProviderConnection;
    DSProviderConnection2: TDSProviderConnection;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FServidorConexaoClient: TConexaoClient;
    FServidorDBClient: TDBClient;
    FServidorDMClient: TDMClient;
    function GetServidorConexaoClient: TConexaoClient;
    function GetDBClient: TDBClient;
    function GetDMClient: TDMClient;
  public
    property Conexao : TConexaoClient read GetServidorConexaoClient write FServidorConexaoClient;
    property DBClient: TDBClient      read GetDBClient              write FServidorDBClient;
    property DMClient: TDMClient      read GetDMClient              write FServidorDMClient;
  end;

var
  SM: TSM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}


procedure TSM.DataModuleCreate(Sender: TObject);
begin
  ConDataSnap.Open;
  FServidorDBClient := TDBClient.Create(ConDataSnap.DBXConnection, True);
  FServidorDMClient := TDMClient.Create(ConDataSnap.DBXConnection, True);
  FServidorConexaoClient := TConexaoClient.Create(ConDataSnap.DBXConnection, True);
end;

function TSM.GetServidorConexaoClient: TConexaoClient;
begin
  if FServidorConexaoClient = nil then
    FServidorConexaoClient := TConexaoClient.Create(ConDataSnap.DBXConnection, True);
  Result := FServidorConexaoClient;
end;

procedure TSM.DataModuleDestroy(Sender: TObject);
begin
  FServidorDBClient.Free;
  FServidorDMClient.Free;
  FServidorConexaoClient.Free;
end;

function TSM.GetDBClient: TDBClient;
begin
  if FServidorDBClient = nil then
    FServidorDBClient := TDBClient.Create(ConDataSnap.DBXConnection, True);
  Result := FServidorDBClient;
end;

function TSM.GetDMClient: TDMClient;
begin
  if FServidorDMClient = nil then
    FServidorDMClient := TDMClient.Create(ConDataSnap.DBXConnection, True);
  Result := FServidorDMClient;
end;

end.
