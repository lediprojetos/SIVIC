class CreateSivicContcelulas < ActiveRecord::Migration
  def change
    create_table :sivic_contcelulas do |t|
      t.integer :NUMR_Contador
      t.references :sivic_igreja, index: true

      t.timestamps
    end
  end
end
