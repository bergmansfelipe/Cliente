program Cliente;

uses
  EMemLeaks,
  EResLeaks,
  EDialogWinAPIMSClassic,
  EDialogWinAPIEurekaLogDetailed,
  EDialogWinAPIStepsToReproduce,
  EDebugExports,
  EDebugJCL,
  EAppVCL,
  ExceptionLog7,
  Vcl.Forms,
  Unit3 in 'Unit3.pas' {Form3},
  DMDCliente in 'DMDCliente.pas' {DMCliente: TDataModule},
  Unit1 in 'Unit1.pas',
  DMDM in 'DMDM.pas' {SM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
//  Application.CreateForm(TSM, SM);
//  Application.CreateForm(TDMCliente, DM);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
