class CreateObservacoesrelatorios < ActiveRecord::Migration
  def change
    create_table :observacoesrelatorios do |t|
      t.references :sivic_relatorioscelula, index: true
      t.references :sivic_pessoa, index: true
      t.string :DESC_Observacao

      t.timestamps
    end
  end
end
