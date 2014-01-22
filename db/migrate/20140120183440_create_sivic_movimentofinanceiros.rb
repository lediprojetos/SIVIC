class CreateSivicMovimentofinanceiros < ActiveRecord::Migration
  def change
    create_table :sivic_movimentofinanceiros do |t|
      t.decimal :VALR_movimento
      t.integer :user_inclusao, :integer, :references => :User 
      t.boolean :FLAG_baixa, default: false
      t.references :sivic_tipmovfinanceiro, index: true
      t.references :sivic_evento, index: true
      t.datetime :DATA_exclusao
      t.integer :user_exclusao, :integer, :references => :User

      t.timestamps
    end
  end
end
