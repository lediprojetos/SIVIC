class CreateSivicEstados < ActiveRecord::Migration
  def change
    create_table :sivic_estados do |t|
      t.string :nome
      t.string :sigla

      t.timestamps
    end
  end
end
