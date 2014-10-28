class CreateSivicRedes < ActiveRecord::Migration
  def change
    create_table :sivic_redes do |t|
      t.string :nome_rede
      t.references :sivic_igreja, index: true

      t.timestamps
    end
  end
end
