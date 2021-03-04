unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uDTMConexao;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPricipal: TfrmPricipal;

implementation

{$R *.dfm}

procedure TfrmPricipal.FormCreate(Sender: TObject);
begin
  //ESTOU CRIANDO A CONEXÃO COM O BANCO AO CRIAR O FORMULARIO
  //SELF = ELE MESMO
  dtmConexao := TdtmConexao.create(self);
  //dtmConexao.fdConexao.SQLHourGlass:=True;
  dtmConexao.fdConexao.Connected:=True;

end;

procedure TfrmPricipal.menuFecharClick(Sender: TObject);
begin
   //Close;
   Application.Terminate;
end;

end.
