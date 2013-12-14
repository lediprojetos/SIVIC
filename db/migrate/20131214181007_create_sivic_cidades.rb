class CreateSivicCidades < ActiveRecord::Migration
  def change
    create_table :sivic_cidades do |t|
      t.string :nome
      t.integer :estado_id

      t.timestamps
    end
  end
end
