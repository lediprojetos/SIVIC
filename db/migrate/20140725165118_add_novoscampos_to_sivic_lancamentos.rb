class AddNovoscamposToSivicLancamentos < ActiveRecord::Migration
  def change
    add_column :sivic_lancamentos, :codi_parcela, :integer
    add_column :sivic_lancamentos, :valr_descontotaxa, :decimal
    add_column :sivic_lancamentos, :valr_jurosmulta, :decimal
    add_column :sivic_lancamentos, :valr_recebido, :decimal
  end
end
