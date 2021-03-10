unit uTelaHeranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ComCtrls, Vcl.ExtCtrls,
  uDTMConexao, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uEnum;

type
  TfrmTelaHeranca = class(TForm)
    pnlRodape: TPanel;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    btnApagar: TBitBtn;
    btnFechar: TBitBtn;
    btnNavigator: TDBNavigator;
    pgcPrincipal: TPageControl;
    tabListagem: TTabSheet;
    pnlListagemTopo: TPanel;
    mskPesquisar: TMaskEdit;
    btnPesquisar: TBitBtn;
    grdListagem: TDBGrid;
    tabManutencao: TTabSheet;
    dtsListagem: TDataSource;
    qryListagem: TFDQuery;
    lblIndice: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdListagemTitleClick(Column: TColumn);
  private
    { Private declarations }
    EstadoDoCadastro:TEstadoDoCadastro;

    procedure ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnApagar:TBitBtn;
          Navegador:TDBNavigator; pgcPrincipal:TPageControl; Flag:Boolean);
    procedure ControlarIndiceTab(pagcPrincipal: TPageControl; indice: integer);
    function RetornarCampoTraduzido(Campo: string): string;
  public
    { Public declarations }
    indeceAtual:string;
  end;

var
  frmTelaHeranca: TfrmTelaHeranca;

implementation

{$R *.dfm}

//PROCEDIMENTO DE CONTROLE DE TELA
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

function TfrmTelaHeranca.RetornarCampoTraduzido(Campo:string): string;
var i:integer;
begin
  for I := 0 to qryListagem.Fields.Count-1 do
  begin
    if qryListagem.Fields[i].FieldName=campo then
    begin
      Result:= qryListagem.Fields[i].DisplayLabel;
      break;
    end;
  end;

end;


 //PROCEDIMENTO CONTROLE DE TELA, AO CLICAR NO BOTÃO ELE VAI MOSTRAR UM DAS PAGINAS DO PAGECONTROL E NÃO MOSTRARA A OUTRA
procedure TfrmTelaHeranca.ControlarIndiceTab(pagcPrincipal: TPageControl; indice: integer);
begin
  if (pgcPrincipal.Pages[Indice].TabVisible) then
  pgcPrincipal.TabIndex:=Indice;
end;

//HABILITANDO E DESABILITANDO BOTÕES
//BOTÃO NOVO
procedure TfrmTelaHeranca.btnNovoClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnApagar,btnNavigator,pgcPrincipal,false);
  EstadoDoCadastro:=ecInserir;
end;

//BOTÃO ALTERAR
procedure TfrmTelaHeranca.btnAlterarClick(Sender: TObject);
begin
   ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnApagar,btnNavigator,pgcPrincipal,false);
   EstadoDoCadastro:=ecAlterar;
end;

//BOTÃO APAGAR
procedure TfrmTelaHeranca.btnApagarClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnApagar,btnNavigator,pgcPrincipal,true);
  ControlarIndiceTab(pgcPrincipal, 0);
  EstadoDoCadastro:=ecNenhum;
end;

//BOTÃO CANCELAR
procedure TfrmTelaHeranca.btnCancelarClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnApagar,btnNavigator,
                  pgcPrincipal,True);
  ControlarIndiceTab(pgcPrincipal, 0);
  EstadoDoCadastro:=ecNenhum;
end;

//BOTÃO FECHAR
procedure TfrmTelaHeranca.btnFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmTelaHeranca.btnGravarClick(Sender: TObject);
begin
  try
    ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnApagar,btnNavigator,pgcPrincipal,true);
    ControlarIndiceTab(pgcPrincipal, 0);

    if (EstadoDoCadastro=ecInserir) then
      Showmessage ('Inserir')
    else if (EstadoDoCadastro=ecAlterar) then
      Showmessage ('Alterado')
    else
      Showmessage ('Nada Acontenceu')
  finally
    EstadoDoCadastro:=ecNenhum;
  end;

end;

procedure TfrmTelaHeranca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
QryListagem.Close;
end;

procedure TfrmTelaHeranca.FormCreate(Sender: TObject);
begin
  qryListagem.Connection:=dtmConexao.fdConexao;
  dtsListagem.DataSet:=qryListagem;
  grdListagem.DataSource:=dtsListagem;
end;

procedure TfrmTelaHeranca.FormShow(Sender: TObject);
begin
  if (QryListagem.SQL.Text <>EmptyStr) then
  begin
    QryListagem.Open;
  end;
end;

procedure TfrmTelaHeranca.grdListagemTitleClick(Column: TColumn);
begin
  indeceAtual:= Column.FieldName;
  QryListagem.IndexFieldNames:=indeceAtual;
  lblIndice.Caption:=RetornarCampoTraduzido(indeceAtual);
end;

end.
