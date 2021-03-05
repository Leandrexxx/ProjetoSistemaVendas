unit uTelaHeranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ComCtrls, Vcl.ExtCtrls,
  uDTMConexao, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmTelaHeranca = class(TForm)
    pgcPrincipal: TPageControl;
    pnlRodape: TPanel;
    tabListagem: TTabSheet;
    pnlListagemTopo: TPanel;
    mskPesquisar: TMaskEdit;
    btnPesquisar: TBitBtn;
    grdListagem: TDBGrid;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    btnApagar: TBitBtn;
    btnFechar: TBitBtn;
    btnNavigator: TDBNavigator;
    qryListagem: TFDQuery;
    dtsListagem: TDataSource;
    tabManutencao: TTabSheet;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }

    procedure ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnApagar:TBitBtn;
          Navegador:TDBNavigator; pgcPrincipal:TPageControl; Flag:Boolean);
  public
    { Public declarations }
  end;

var
  frmTelaHeranca: TfrmTelaHeranca;

implementation

{$R *.dfm}

//AQUI EU PRECISO DIZER A QUAL FORMULARIO ELE ESTA INSTANCIADO
procedure TfrmTelaHeranca.btnNovoClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnApagar,btnNavigator,pgcPrincipal,false);
end;

procedure TfrmTelaHeranca.ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnApagar:TBitBtn;
          navegador:TDBNavigator; pgcPrincipal:TPageControl; Flag:Boolean);
begin
   btnNovo.Enabled    :=Flag;
   btnApagar.Enabled  :=Flag;
   btnAlterar.Enabled :=Flag;
  // dbNavi.Enabled :=Flag;
   navegador.Enabled :=Flag;
   pgcPrincipal.Pages[0].TabVisible :=Flag;
   btnCancelar.Enabled :=not(Flag);
   btnGravar.Enabled :=not(Flag);
end;

procedure TfrmTelaHeranca.btnAlterarClick(Sender: TObject);
begin
   ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnApagar,btnNavigator,pgcPrincipal,false);
end;

procedure TfrmTelaHeranca.btnApagarClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnApagar,btnNavigator,pgcPrincipal,true);
end;

procedure TfrmTelaHeranca.btnCancelarClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnApagar,btnNavigator,pgcPrincipal,True);
end;

procedure TfrmTelaHeranca.btnFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmTelaHeranca.btnGravarClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnApagar,btnNavigator,pgcPrincipal,true);
end;

procedure TfrmTelaHeranca.FormCreate(Sender: TObject);
begin
  qryListagem.Connection:=dtmConexao.fdConexao;
  dtsListagem.DataSet:=qryListagem;
  grdListagem.DataSource:=dtsListagem;
end;

end.
