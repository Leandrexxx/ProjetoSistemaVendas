inherited frmCadCategoria: TfrmCadCategoria
  Caption = 'Cadastro de Categorias'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlRodape: TPanel
    ExplicitWidth = 862
    inherited btnFechar: TBitBtn
      ExplicitLeft = 768
    end
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited pgcPrincipal: TPageControl
    ExplicitLeft = 0
    ExplicitTop = 0
    inherited tabListagem: TTabSheet
      ExplicitWidth = 854
      inherited pnlListagemTopo: TPanel
        ExplicitWidth = 854
      end
      inherited grdListagem: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'CATEGORIAID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Width = 498
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitWidth = 854
    end
  end
  inherited qryListagem: TFDQuery
    UpdateOptions.AssignedValues = [uvGeneratorName, uvUpdateNonBaseFields, uvAutoCommitUpdates]
    UpdateOptions.GeneratorName = 'GEN_CATEGORIAS_ID'
    UpdateOptions.AutoIncFields = 'CATEGORIASID'
    SQL.Strings = (
      'SELECT CATEGORIAID, DESCRICAO FROM CATEGORIAS')
    object qryListagemCATEGORIAID: TIntegerField
      DisplayLabel = 'CODIGO'
      FieldName = 'CATEGORIAID'
      Origin = 'CATEGORIAID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryListagemDESCRICAO: TWideStringField
      DisplayLabel = 'DESCRI'#199#195'O'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 50
    end
  end
end
