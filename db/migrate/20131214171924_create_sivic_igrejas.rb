class CreateSivicIgrejas < ActiveRecord::Migration
  def change
    create_table :sivic_igrejas do |t|
      t.string :nome
      t.integer :igrejaSede_id
      t.integer :endereco_id

      t.timestamps
    end
  end
end
