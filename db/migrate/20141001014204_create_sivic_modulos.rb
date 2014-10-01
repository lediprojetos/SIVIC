class CreateSivicModulos < ActiveRecord::Migration
  def change
    create_table :sivic_modulos do |t|
      t.string :nome_modulo
      t.string :desc_modulo
      t.datetime :data_bloqueio

      t.timestamps
    end
  end
end
