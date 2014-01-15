class CreateSivicCelulas < ActiveRecord::Migration
  def change
    create_table :sivic_celulas do |t|
      t.references :sivic_pessoa, index: true
      t.references :sivic_endereco, index: true
      t.string :NUMR_Dia
      t.datetime :DATA_Bloqueio

      t.timestamps
    end
  end
end
