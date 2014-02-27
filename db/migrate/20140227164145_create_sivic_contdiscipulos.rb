class CreateSivicContdiscipulos < ActiveRecord::Migration
  def change
    create_table :sivic_contdiscipulos do |t|
      t.integer :NUMR_Contador
      t.references :sivic_igreja, index: true

      t.timestamps
    end
  end
end
