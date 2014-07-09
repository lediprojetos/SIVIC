class CreateSivicLancamentos < ActiveRecord::Migration
  def change
    create_table :sivic_lancamentos do |t|
      t.string :nome_lancamento
      t.decimal :valr_lancamento
      t.date :data_vencimento
      t.date :data_competencia
      t.boolean :flag_pago
      t.boolean :flag_dizimo
      t.integer :numr_recorrencia
      t.references :sivic_category, index: true
      t.references :sivic_centrocusto, index: true
      t.references :sivic_rede, index: true
      t.references :sivic_tipmovfinanceiro, index: true
      t.references :sivic_pessoa, index: true
      t.references :sivic_fornecedor, index: true
      t.references :sivic_igreja, index: true
      t.references :user, index: true
      t.references :user, index: true
      t.datetime :data_exclusao

      t.timestamps
    end
  end
end
