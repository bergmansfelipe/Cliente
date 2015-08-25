unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdHTTP, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, DBXJSON, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons;

type
  TForm3 = class(TForm)
    Consumir: TButton;
    memoResposta: TMemo;
    IdHTTP: TIdHTTP;
    Button1: TButton;
    DBGrid1: TDBGrid;
    edtConta: TEdit;
    Label1: TLabel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DBGrid2: TDBGrid;
    Button5: TButton;
    BitBtn1: TBitBtn;
    Button6: TButton;
    edtNome: TEdit;
    edtSessao: TEdit;
    //Passei por aqui :)
    // Felipe tamb�m passou
  private
    function UrlPost(Url, Parametro: String): String;
  public
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses
  ModuloUtils, DMDM, DMDCliente;


function TForm3.UrlPost(Url, Parametro: String): String;

  function ParseJson(StrJson: String): String;
  var
    LJsonObject: TJSONObject;
    LJsonArr   : TJSONArray;
  begin
     LJsonObject := TJSONObject.Create;
     try
       LJsonObject.Parse(TEncoding.ASCII.GetBytes(StrJson), 0);
       LJsonArr := LJsonObject.Get(0).JsonValue as TJSONArray;
       Result := LJsonArr.Get(0).Value;
     finally
       LJsonObject.Free;
     end;
  end;

var
  lRequest: TStringStream;
  IdHTTP: TIdHttp;
begin
  IdHTTP := TIdHttp.Create(nil);
  lRequest := TStringStream.Create(Parametro, TEncoding.UTF8);
  try
    try
      IdHttp.Request.BasicAuthentication := True;
      IdHttp.Request.Username := 'Felipe';
      IdHttp.Request.Password := '123';
      IdHTTP.Request.CharSet := 'utf-8';
      IdHTTP.Request.ContentEncoding := 'utf-8';
      IdHTTP.Request.ContentType := 'application/json';
      IdHTTP.Request.CustomHeaders.Values['Pragma'] := 'dssession=' + '123';
      Result := ParseJson(IdHTTP.Post(Url, lRequest));
    except
      on E: Exception do
        ShowMessage('Ocorreu um erro:'#13#10 + E.Message);
    end;
  finally
    IdHTTP.Free;
    lRequest.Free;
  end;
end;

procedure TForm3.BitBtn1Click(Sender: TObject);
begin
  ShowMessage(SM.DMClient.GetParams);
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
  IdHttp.Request.BasicAuthentication := True;
  IdHttp.Request.Username := 'conta|anuncios';
  IdHttp.Request.Password := '';
  IdHTTP.Get('http://ws1.ourofast.com/ows/TServidorClienteArea/getAnuncio/imobzi/aplicacao_windows');
end;

procedure TForm3.ConsumirClick(Sender: TObject);

  procedure ReverseString;
  var
    ObjetoJson: TJSONObject;
    JSONArray: TJSONArray;
  begin
    ObjetoJson := TJsonObject.Create;
    JSONArray := TJSONArray.Create;
    try
      JSONArray.AddElement(TJSONString.Create('fulanoimoveis'));
      ObjetoJson.AddPair('_parameters', JSONArray);
      memoResposta.Lines.Add(UrlPost(
        'http://10.0.0.104:8080/datasnap/rest/TServerMethods2/ReverseString',
        ObjetoJson.ToString));
    finally
      ObjetoJson.Free;
    end;
  end;

  procedure UsuarioLogar;
  var
    ObjetoJson: TJSONObject;
    JSONArray: TJSONArray;
  begin
    ObjetoJson := TJsonObject.Create;
    JSONArray := TJSONArray.Create;
    try
      JSONArray.AddElement(TJSONString.Create('FELIPE'));
      ObjetoJson.AddPair('_parameters', JSONArray);
      memoResposta.Lines.Add(UrlPost(
        'http://10.0.0.104:8080/datasnap/rest/TServerMethods2/UsuarioLogar',
        ObjetoJson.ToString));
    finally
      ObjetoJson.Free;
    end;
  end;

  procedure UsuarioLogado;
  var
    ObjetoJson: TJSONObject;
    JSONArray: TJSONArray;
  begin
    ObjetoJson := TJsonObject.Create;
    JSONArray := TJSONArray.Create;
    try
      JSONArray.AddElement(TJSONString.Create('fulanoimoveis'));
      JSONArray.AddElement(TJSONString.Create('FELIPE'));
      ObjetoJson.AddPair('_parameters', JSONArray);
      memoResposta.Lines.Add(UrlPost(
        'http://10.0.0.104:8080/datasnap/rest/TServerMethods2/UsuarioLogado',
        ObjetoJson.ToString));
    finally
      ObjetoJson.Free;
    end;
  end;

begin
//  ReverseString;
//  UsuarioLogar;
  UsuarioLogado;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  SM.DBClient.BancoDadosConectar(edtConta.Text);
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
  SM.DMClient.SetConexao;
end;

procedure TForm3.Button4Click(Sender: TObject);
begin
  DM.cdsBanco.Close;
  DM.cdsBanco.Open;
end;

procedure TForm3.Button5Click(Sender: TObject);
begin
  DM.cdsMoeda.Close;
  DM.cdsMoeda.Open;
end;

procedure TForm3.Button6Click(Sender: TObject);

  function UrlSessionPost(Url, Parametro: String): String;

    function ParseJson(StrJson: String): String;
    var
      LJsonObject: TJSONObject;
      LJsonArr   : TJSONArray;
    begin
       LJsonObject := TJSONObject.Create;
       try
         LJsonObject.Parse(TEncoding.ASCII.GetBytes(StrJson), 0);
         LJsonArr := LJsonObject.Get(0).JsonValue as TJSONArray;
         Result := LJsonArr.Get(0).Value;
       finally
         LJsonObject.Free;
       end;
    end;

  var
    lRequest: TStringStream;
    Sessao: String;
    IdHTTP: TIdHttp;
  begin
    IdHTTP := TIdHttp.Create(nil);
    lRequest := TStringStream.Create(Parametro, TEncoding.UTF8);
    try
      try
        IdHttp.Request.BasicAuthentication := True;
        IdHttp.Request.Username := edtNome.Text;
        IdHttp.Request.Password := '123';
        IdHTTP.Request.CharSet := 'utf-8';
        IdHTTP.Request.ContentEncoding := 'utf-8';
        IdHTTP.Request.ContentType := 'application/json';
        Sessao := ParseJson(IdHTTP.Get('http://10.0.0.104:8080/datasnap/rest/TServerMethods2/UsuarioSessao'));
        if edtSessao.Text = '' then edtSessao.Text := Sessao;
        IdHTTP.Request.CustomHeaders.Values['Pragma'] := 'dssession=' + Sessao;
        Result := ParseJson(IdHTTP.Post(Url, lRequest));
        memoResposta.Lines.Add('*'+ParseJson(IdHTTP.Get('http://10.0.0.104:8080/datasnap/rest/TServerMethods2/UsuarioSessaoSenha/'+edtSessao.Text))+'*');
      except
        on E: Exception do
          ShowMessage('Ocorreu um erro:'#13#10 + E.Message);
      end;
    finally
      IdHTTP.Free;
      lRequest.Free;
    end;
  end;

  procedure Usuario;
  begin
    memoResposta.Lines.Add(UrlSessionPost(
      'http://10.0.0.104:8080/datasnap/rest/TServerMethods2/UsuarioGetNome', ''));
  end;

begin
  Usuario;
end;

end.
