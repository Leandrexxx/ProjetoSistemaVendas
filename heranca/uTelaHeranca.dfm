object frmTelaHeranca: TfrmTelaHeranca
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'INFORME AQUI O TITULO'
  ClientHeight = 498
  ClientWidth = 870
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pgcPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 870
    Height = 440
    ActivePage = tabManutencao
    Align = alClient
    TabOrder = 0
    object tabListagem: TTabSheet
      Caption = 'Listagem'
    end
    object tabManutencao: TTabSheet
      Caption = 'Manuten'#231#227'o'
      ImageIndex = 1
      object pnlListagemTopo: TPanel
        Left = 0
        Top = 0
        Width = 862
        Height = 65
        Align = alTop
        TabOrder = 0
      end
      object grdListagem: TDBGrid
        Left = 0
        Top = 65
        Width = 862
        Height = 347
        Align = alClient
        DataSource = dtsListagem
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 440
    Width = 870
    Height = 58
    Align = alBottom
    TabOrder = 1
    object btnNovo: TBitBtn
      Left = 16
      Top = 16
      Width = 75
      Height = 25
      Caption = '&Novo'
      TabOrder = 0
    end
    object btnAlterar: TBitBtn
      Left = 97
      Top = 16
      Width = 75
      Height = 25
      Caption = '&ALterar'
      TabOrder = 1
    end
    object btnCancelar: TBitBtn
      Left = 178
      Top = 16
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 2
    end
    object btnGravar: TBitBtn
      Left = 259
      Top = 16
      Width = 75
      Height = 25
      Caption = '&Gravar'
      TabOrder = 3
    end
    object btnApagar: TBitBtn
      Left = 340
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Apaga&r'
      TabOrder = 4
    end
    object btnFechar: TBitBtn
      Left = 776
      Top = 16
      Width = 75
      Height = 25
      Caption = '&Fechar'
      TabOrder = 5
      OnClick = btnFecharClick
    end
    object btnNavigator: TDBNavigator
      Left = 440
      Top = 16
      Width = 224
      Height = 25
      DataSource = dtsListagem
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 6
    end
  end
  object mskPesquisar: TMaskEdit
    Left = 16
    Top = 47
    Width = 409
    Height = 21
    TabOrder = 2
    Text = ''
    TextHint = 'Digite sua pesquisa'
  end
  object btnPesquisar: TBitBtn
    Left = 440
    Top = 45
    Width = 97
    Height = 25
    Caption = '&Pesquisar'
    TabOrder = 3
  end
  object qryListagem: TFDQuery
    Connection = dtmConexao.fdConexao
    Left = 576
    Top = 32
  end
  object dtsListagem: TDataSource
    DataSet = qryListagem
    Left = 648
    Top = 32
  end
end
