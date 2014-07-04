class CreateSivicCategoria < ActiveRecord::Migration
  def change
    create_table :sivic_categoria do |t|
      t.string :nome_categoria
      t.integer :tipo_categoria
      t.references :user, index: true
      t.references :sivic_igreja, index: true

      t.timestamps
    end
  end
end
