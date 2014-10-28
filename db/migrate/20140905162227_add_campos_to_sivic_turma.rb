class AddCamposToSivicTurma < ActiveRecord::Migration
  def change
    add_column :sivic_turmas, :numr_mediareprovado, :float
    add_column :sivic_turmas, :numr_mediarecuperacao, :float
    add_column :sivic_turmas, :numr_mediaaprovado, :float
    add_column :sivic_turmas, :numr_faltareprovado, :integer
  end
end
