unit DMDCliente;

interface

uses
  System.SysUtils, System.Classes, Data.DBXDataSnap, IPPeerClient,
  Data.DBXCommon, Data.DB, Data.SqlExpr, Datasnap.DBClient, Datasnap.DSConnect;

type
  TDMCliente = class(TDataModule)
    cdsBanco: TClientDataSet;
    dsBanco: TDataSource;
    cdsMoeda: TClientDataSet;
    dsMoeda: TDataSource;
  private
  public
  end;

var
  DM: TDMCliente;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  DMDM;

end.
