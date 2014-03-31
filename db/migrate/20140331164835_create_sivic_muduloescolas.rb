class CreateSivicMuduloescolas < ActiveRecord::Migration
  def change
    create_table :sivic_muduloescolas do |t|
      t.references :sivic_igreja, index: true
      t.integer :user_inclusao, :integer, :references => :User, index: true
      t.string :nome_modulo

      t.timestamps
    end
  end
end
