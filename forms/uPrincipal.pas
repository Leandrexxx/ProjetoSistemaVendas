unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uDTMConexao, uCadCategoria,
  Enter;

type
  TfrmPricipal = class(TForm)
    mainPrincipal: TMainMenu;
    CADASTRO1: TMenuItem;
    MOVIMENTAO1: TMenuItem;
    RELATRIOS1: TMenuItem;
    CLIENTE1: TMenuItem;
    N1: TMenuItem;
    CATEGORIA1: TMenuItem;
    PRODUTO1: TMenuItem;
    N2: TMenuItem;
    menuFechar: TMenuItem;
    VENDAS1: TMenuItem;
    CLIENTE2: TMenuItem;
    N3: TMenuItem;
    PRODUTO2: TMenuItem;
    N4: TMenuItem;
    VENDAPORDATA1: TMenuItem;
    procedure menuFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CATEGORIA1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    TeclaEnter: TMREnter;
  public
    { Public declarations }
  end;

var
  frmPricipal: TfrmPricipal;

implementation

{$R *.dfm}

procedure TfrmPricipal.CATEGORIA1Click(Sender: TObject);
begin
   frmCadCategoria := TfrmCadCategoria.Create(Self);  //CRIANDO ELE NA MEMORIA
   frmCadCategoria.ShowModal; //MOSTRANDO ELE NA TELA
   frmCadCategoria.Release; //LIMPANDO ELE DA MEMORIA AO FECHAR O FORMULARIO
end;

procedure TfrmPricipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(TeclaEnter); //AQUI EU ESTOU DESTRUIDO O QUE FOI CRIANDO EM TEMPO DE EXECUÇÃO E A CONEXÃO COM O BANCO
  FreeAndNil(dtmConexao);
end;

procedure TfrmPricipal.FormCreate(Sender: TObject);
begin
  //ESTOU CRIANDO A CONEXÃO COM O BANCO AO CRIAR O FORMULARIO
  //SELF = ELE MESMO
  dtmConexao := TdtmConexao.create(self);
  //dtmConexao.fdConexao.SQLHourGlass:=True;
  dtmConexao.fdConexao.Connected:=True;

  TeclaEnter:= TMREnter.Create(Self);
  TeclaEnter.FocusEnabled:=True;
  TeclaEnter.FocusColor:=ClInfoBk;
end;



procedure TfrmPricipal.menuFecharClick(Sender: TObject);
begin
   //Close;
   Application.Terminate;
end;

end.
