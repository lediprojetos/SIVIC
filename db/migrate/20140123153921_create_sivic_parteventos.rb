class CreateSivicParteventos < ActiveRecord::Migration
  def change
    create_table :sivic_parteventos do |t|
      t.references :sivic_pessoa, index: true
      t.references :sivic_evento, index: true
      t.references :sivic_movimentofinanceiro, index: true
      t.boolean :FLAG_naoparticipou

      t.timestamps
    end
  end
end
