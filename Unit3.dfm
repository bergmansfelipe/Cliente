object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Cliente'
  ClientHeight = 185
  ClientWidth = 535
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 9
    Top = 235
    Width = 33
    Height = 13
    Caption = 'Conta:'
  end
  object Consumir: TButton
    Left = 8
    Top = 136
    Width = 321
    Height = 41
    Caption = 'Consumir'
    TabOrder = 0
  end
  object memoResposta: TMemo
    Left = 8
    Top = 8
    Width = 321
    Height = 122
    Lines.Strings = (
      'memoResposta')
    TabOrder = 1
  end
  object Button1: TButton
    Left = 8
    Top = 189
    Width = 521
    Height = 25
    Caption = 'Button1'
    TabOrder = 2
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 260
    Width = 521
    Height = 229
    DataSource = DMCliente.dsBanco
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object edtConta: TEdit
    Left = 48
    Top = 231
    Width = 225
    Height = 21
    TabOrder = 4
    Text = 'fulanoimoveis'
  end
  object Button2: TButton
    Left = 280
    Top = 229
    Width = 105
    Height = 25
    Caption = 'Conectar'
    TabOrder = 5
  end
  object Button3: TButton
    Left = 640
    Top = 495
    Width = 121
    Height = 37
    Caption = 'Set Banco Dados '
    TabOrder = 6
  end
  object Button4: TButton
    Left = 376
    Top = 495
    Width = 153
    Height = 37
    Caption = 'DataSet Bancos Abrir'
    TabOrder = 7
  end
  object DBGrid2: TDBGrid
    Left = 535
    Top = 260
    Width = 449
    Height = 229
    DataSource = DMCliente.dsMoeda
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button5: TButton
    Left = 767
    Top = 495
    Width = 136
    Height = 37
    Caption = 'DataSet Moeda Abrir '
    TabOrder = 9
  end
  object BitBtn1: TBitBtn
    Left = 909
    Top = 495
    Width = 75
    Height = 37
    Caption = 'Show Params'
    TabOrder = 10
  end
  object Button6: TButton
    Left = 335
    Top = 136
    Width = 192
    Height = 41
    Caption = 'GetUsuario'
    TabOrder = 11
  end
  object edtNome: TEdit
    Left = 335
    Top = 109
    Width = 192
    Height = 21
    TabOrder = 12
    Text = 'Felipe'
  end
  object edtSessao: TEdit
    Left = 335
    Top = 53
    Width = 192
    Height = 21
    TabOrder = 13
  end
  object IdHTTP: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 16
    Top = 64
  end
end
