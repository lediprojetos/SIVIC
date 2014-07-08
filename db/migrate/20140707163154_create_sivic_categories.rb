class CreateSivicCategories < ActiveRecord::Migration
  def change
    create_table :sivic_categories do |t|
      t.integer :father_id, :integer, :references => :sivic_categories 
      t.string :nome_categoria
      t.integer :tipo_categoria
      t.references :sivic_igreja, index: true
      t.integer :user_inclusao, :integer, :references => :User, index: true
      t.integer :user_exclusao, :integer, :references => :User, index: true
      t.datetime :DATA_exclusao

      t.timestamps
    end
  end
end
