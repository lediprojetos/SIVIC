class CreateSivicSitpartcelulas < ActiveRecord::Migration
  def change
    create_table :sivic_sitpartcelulas do |t|
      t.string :DESC_situacao
      t.references :sivic_igreja, index: true

      t.timestamps
    end
  end
end
