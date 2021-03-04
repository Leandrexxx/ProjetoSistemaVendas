program ProjetoVendas;

uses
  Vcl.Forms,
  uPrincipal in '..\forms\uPrincipal.pas' {frmPricipal},
  uDTMConexao in '..\datamodule\uDTMConexao.pas' {dtmConexao: TDataModule},
  uTelaHeranca in '..\heranca\uTelaHeranca.pas' {frmTelaHeranca};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPricipal, frmPricipal);
  Application.CreateForm(TdtmConexao, dtmConexao);
  Application.CreateForm(TfrmTelaHeranca, frmTelaHeranca);
  Application.Run;
end.
