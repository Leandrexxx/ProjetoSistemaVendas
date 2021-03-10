object frmTelaHeranca: TfrmTelaHeranca
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'INFORME AQUI O TITULO'
  ClientHeight = 498
  ClientWidth = 862
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblIndice: TLabel
    Left = 696
    Top = 32
    Width = 39
    Height = 13
    Caption = 'lblIndice'
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 440
    Width = 862
    Height = 58
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      862
      58)
    object btnNovo: TBitBtn
      Left = 16
      Top = 16
      Width = 75
      Height = 25
      Caption = '&Novo'
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnAlterar: TBitBtn
      Left = 97
      Top = 16
      Width = 75
      Height = 25
      Caption = '&ALterar'
      TabOrder = 1
      OnClick = btnAlterarClick
    end
    object btnCancelar: TBitBtn
      Left = 178
      Top = 16
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 2
      OnClick = btnCancelarClick
    end
    object btnGravar: TBitBtn
      Left = 259
      Top = 16
      Width = 75
      Height = 25
      Caption = '&Gravar'
      TabOrder = 3
      OnClick = btnGravarClick
    end
    object btnApagar: TBitBtn
      Left = 340
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Apaga&r'
      TabOrder = 4
      OnClick = btnApagarClick
    end
    object btnFechar: TBitBtn
      Left = 768
      Top = 16
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Fechar'
      TabOrder = 5
      OnClick = btnFecharClick
    end
    object btnNavigator: TDBNavigator
      Left = 440
      Top = 16
      Width = 224
      Height = 25
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 6
    end
  end
  object pgcPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 862
    Height = 440
    ActivePage = tabListagem
    Align = alClient
    TabOrder = 1
    object tabListagem: TTabSheet
      Caption = 'Listagem'
      ImageIndex = 1
      object pnlListagemTopo: TPanel
        Left = 0
        Top = 0
        Width = 854
        Height = 65
        Align = alTop
        TabOrder = 0
        ExplicitLeft = -3
        ExplicitTop = 3
        object mskPesquisar: TMaskEdit
          Left = 21
          Top = 23
          Width = 409
          Height = 21
          Enabled = False
          TabOrder = 0
          Text = ''
          TextHint = 'Digite sua pesquisa'
        end
        object btnPesquisar: TBitBtn
          Left = 456
          Top = 21
          Width = 97
          Height = 25
          Caption = '&Pesquisar'
          TabOrder = 1
        end
      end
      object grdListagem: TDBGrid
        Left = 0
        Top = 65
        Width = 854
        Height = 347
        Align = alClient
        DataSource = dtsListagem
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnTitleClick = grdListagemTitleClick
      end
    end
    object tabManutencao: TTabSheet
      Caption = 'Manuten'#231#227'o'
      ImageIndex = 1
    end
  end
  object dtsListagem: TDataSource
    DataSet = qryListagem
    Left = 648
    Top = 32
  end
  object qryListagem: TFDQuery
    Connection = dtmConexao.fdConexao
    Left = 576
    Top = 32
  end
end
