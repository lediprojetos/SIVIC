class CreateSivicCidades < ActiveRecord::Migration
  def change
    create_table :sivic_cidades do |t|
      t.string :nome_cidade
      t.references :sivic_estado, index: true

      t.timestamps
    end
  end
end
