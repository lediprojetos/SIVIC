class CreateSivicCelulas < ActiveRecord::Migration
  def change
    create_table :sivic_celulas do |t|
      t.string :NOME_Celula
      t.references :sivic_pessoa, index: true
      t.references :sivic_endereco, index: true
      t.integer :user_inclusao, :integer, :references => :User, index: true
      t.string :NUMR_Dia
      t.string :DESC_Bloqueio
      t.integer :user_bloqueio, :integer, :references => :User, index: true

      t.datetime :DATA_Bloqueio

      t.timestamps
    end
  end
end
