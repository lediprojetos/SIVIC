class CreateSivicDiscipulos < ActiveRecord::Migration
  def change
    create_table :sivic_discipulos do |t|
      t.references :sivic_pessoa, index: true
      t.references :sivic_endereco, index: true
      t.references :sivic_profissao, index: true
      t.references :sivic_escolaridade, index: true
      t.references :sivic_rede, index: true
      t.references :sivic_celula, index: true
      t.integer :NUMG_ProfissaoConjuge, :integer, :references => :sivic_profissao, index: true 
      t.integer :NUMG_UsuarioInclusao, :integer, :references => :User, index: true 
      t.integer :NUMG_UsuarioBloqueio, :integer, :references => :User, index: true 
      t.string :DESC_Sexo
      t.date :DATA_Nascimento
      t.string :DESC_Apelido
      t.string :DESC_EstadoCivil
      t.string :NOME_Conjuge
      t.date :DATA_Decisao
      t.integer :NUMR_QtdFilhos
      t.boolean :FLAG_Membro
      t.boolean :FLAG_RecebeuCristo
      t.boolean :FLAG_Reconciliacao
      t.boolean :FLAG_OcasiaoCelula
      t.boolean :FLAG_OcasiaoCelebracaoEvento
      t.boolean :FLAG_OcasiaoEvangelismoPessoal
      t.boolean :FLAG_OcasiaoCultoLivre
      t.boolean :FLAG_Trabalhando
      t.string :DESC_MomentoEstudoBiblico
      t.string :NUMR_RG
      t.date :DATA_EmissaoRG
      t.string :NUMR_CPF, :limit => 11
      t.string :NOME_Pai
      t.string :NOME_Mae
      t.date :DATA_NascConjuge
      t.date :DATA_Casamento
      t.string :NUMR_TituloEleitoral
      t.date :DATA_Batismo
      t.string :DESC_IgrejaBatismo
      t.boolean :FLAG_DoadorSangue
      t.boolean :FLAG_DoadorOrgao

      t.timestamps
    end
  end
end
