program ProjetoVendas;

uses
  Vcl.Forms,
  uPrincipal in '..\forms\uPrincipal.pas' {frmPricipal},
  uDTMConexao in '..\datamodule\uDTMConexao.pas' {dtmConexao: TDataModule},
  uTelaHeranca in '..\heranca\uTelaHeranca.pas' {frmTelaHeranca},
  uCadCategoria in '..\cadastro\uCadCategoria.pas' {frmCadCategoria},
  Enter in '..\terceiros\Enter.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPricipal, frmPricipal);
  Application.Run;
end.
