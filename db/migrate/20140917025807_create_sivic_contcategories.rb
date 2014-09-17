class CreateSivicContcategories < ActiveRecord::Migration
  def change
    create_table :sivic_contcategories do |t|
      t.integer :numr_contador
      t.references :sivic_igreja, index: true

      t.timestamps
    end
  end
end
