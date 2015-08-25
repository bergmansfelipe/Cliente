//
// Created by the DataSnap proxy generator.
// 12/12/2014 15:43:08
//

unit Unit1;

interface

uses Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TServerMethods2Client = class(TDSAdminClient)
  private
    FEchoStringCommand: TDBXCommand;
    FupdateReverseStringCommand: TDBXCommand;
    FupdateUsuarioLogarCommand: TDBXCommand;
    FupdateUsuarioLogadoCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string): string;
    function updateReverseString(Value: string): string;
    function updateUsuarioLogar(Conta: string): string;
    function updateUsuarioLogado(Conta: string; Usuario: string): string;
  end;

  TConexaoClient = class(TDSAdminClient)
  private
    FGetConnectionCommand: TDBXCommand;
    FGetParamsCommand: TDBXCommand;
    FBdConectarCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function GetConnection: TSQLConnection;
    function GetParams: string;
    procedure BdConectar(ConexaoBD: TSQLConnection; Conta: string);
  end;

  TDBClient = class(TDSAdminClient)
  private
    FBancoDadosConectarCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure BancoDadosConectar(Conta: string);
  end;

  TDMClient = class(TDSAdminClient)
  private
    FGetParamsCommand: TDBXCommand;
    FSetConexaoCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function GetParams: string;
    procedure SetConexao;
  end;

implementation

function TServerMethods2Client.EchoString(Value: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FDBXConnection.CreateCommand;
    FEchoStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEchoStringCommand.Text := 'TServerMethods2.EchoString';
    FEchoStringCommand.Prepare;
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.ExecuteUpdate;
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods2Client.updateReverseString(Value: string): string;
begin
  if FupdateReverseStringCommand = nil then
  begin
    FupdateReverseStringCommand := FDBXConnection.CreateCommand;
    FupdateReverseStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FupdateReverseStringCommand.Text := 'TServerMethods2.updateReverseString';
    FupdateReverseStringCommand.Prepare;
  end;
  FupdateReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FupdateReverseStringCommand.ExecuteUpdate;
  Result := FupdateReverseStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods2Client.updateUsuarioLogar(Conta: string): string;
begin
  if FupdateUsuarioLogarCommand = nil then
  begin
    FupdateUsuarioLogarCommand := FDBXConnection.CreateCommand;
    FupdateUsuarioLogarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FupdateUsuarioLogarCommand.Text := 'TServerMethods2.updateUsuarioLogar';
    FupdateUsuarioLogarCommand.Prepare;
  end;
  FupdateUsuarioLogarCommand.Parameters[0].Value.SetWideString(Conta);
  FupdateUsuarioLogarCommand.ExecuteUpdate;
  Result := FupdateUsuarioLogarCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods2Client.updateUsuarioLogado(Conta: string; Usuario: string): string;
begin
  if FupdateUsuarioLogadoCommand = nil then
  begin
    FupdateUsuarioLogadoCommand := FDBXConnection.CreateCommand;
    FupdateUsuarioLogadoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FupdateUsuarioLogadoCommand.Text := 'TServerMethods2.updateUsuarioLogado';
    FupdateUsuarioLogadoCommand.Prepare;
  end;
  FupdateUsuarioLogadoCommand.Parameters[0].Value.SetWideString(Conta);
  FupdateUsuarioLogadoCommand.Parameters[1].Value.SetWideString(Usuario);
  FupdateUsuarioLogadoCommand.ExecuteUpdate;
  Result := FupdateUsuarioLogadoCommand.Parameters[2].Value.GetWideString;
end;


constructor TServerMethods2Client.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TServerMethods2Client.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TServerMethods2Client.Destroy;
begin
  FreeAndNil(FEchoStringCommand);
  FreeAndNil(FupdateReverseStringCommand);
  FreeAndNil(FupdateUsuarioLogarCommand);
  FreeAndNil(FupdateUsuarioLogadoCommand);
  inherited;
end;

function TConexaoClient.GetConnection: TSQLConnection;
begin
  if FGetConnectionCommand = nil then
  begin
    FGetConnectionCommand := FDBXConnection.CreateCommand;
    FGetConnectionCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetConnectionCommand.Text := 'TConexao.GetConnection';
    FGetConnectionCommand.Prepare;
  end;
  FGetConnectionCommand.ExecuteUpdate;
  if not FGetConnectionCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDBXClientCommand(FGetConnectionCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TSQLConnection(FUnMarshal.UnMarshal(FGetConnectionCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetConnectionCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TConexaoClient.GetParams: string;
begin
  if FGetParamsCommand = nil then
  begin
    FGetParamsCommand := FDBXConnection.CreateCommand;
    FGetParamsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetParamsCommand.Text := 'TConexao.GetParams';
    FGetParamsCommand.Prepare;
  end;
  FGetParamsCommand.ExecuteUpdate;
  Result := FGetParamsCommand.Parameters[0].Value.GetWideString;
end;

procedure TConexaoClient.BdConectar(ConexaoBD: TSQLConnection; Conta: string);
begin
  if FBdConectarCommand = nil then
  begin
    FBdConectarCommand := FDBXConnection.CreateCommand;
    FBdConectarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FBdConectarCommand.Text := 'TConexao.BdConectar';
    FBdConectarCommand.Prepare;
  end;
  if not Assigned(ConexaoBD) then
    FBdConectarCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FBdConectarCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FBdConectarCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(ConexaoBD), True);
      if FInstanceOwner then
        ConexaoBD.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FBdConectarCommand.Parameters[1].Value.SetWideString(Conta);
  FBdConectarCommand.ExecuteUpdate;
end;


constructor TConexaoClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TConexaoClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TConexaoClient.Destroy;
begin
  FreeAndNil(FGetConnectionCommand);
  FreeAndNil(FGetParamsCommand);
  FreeAndNil(FBdConectarCommand);
  inherited;
end;

procedure TDBClient.BancoDadosConectar(Conta: string);
begin
  if FBancoDadosConectarCommand = nil then
  begin
    FBancoDadosConectarCommand := FDBXConnection.CreateCommand;
    FBancoDadosConectarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FBancoDadosConectarCommand.Text := 'TDB.BancoDadosConectar';
    FBancoDadosConectarCommand.Prepare;
  end;
  FBancoDadosConectarCommand.Parameters[0].Value.SetWideString(Conta);
  FBancoDadosConectarCommand.ExecuteUpdate;
end;


constructor TDBClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TDBClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TDBClient.Destroy;
begin
  FreeAndNil(FBancoDadosConectarCommand);
  inherited;
end;

function TDMClient.GetParams: string;
begin
  if FGetParamsCommand = nil then
  begin
    FGetParamsCommand := FDBXConnection.CreateCommand;
    FGetParamsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetParamsCommand.Text := 'TDM.GetParams';
    FGetParamsCommand.Prepare;
  end;
  FGetParamsCommand.ExecuteUpdate;
  Result := FGetParamsCommand.Parameters[0].Value.GetWideString;
end;

procedure TDMClient.SetConexao;
begin
  if FSetConexaoCommand = nil then
  begin
    FSetConexaoCommand := FDBXConnection.CreateCommand;
    FSetConexaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSetConexaoCommand.Text := 'TDM.SetConexao';
    FSetConexaoCommand.Prepare;
  end;
  FSetConexaoCommand.ExecuteUpdate;
end;


constructor TDMClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TDMClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TDMClient.Destroy;
begin
  FreeAndNil(FGetParamsCommand);
  FreeAndNil(FSetConexaoCommand);
  inherited;
end;

end.
