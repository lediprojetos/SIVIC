class CreateSivicCentrocustos < ActiveRecord::Migration
  def change
    create_table :sivic_centrocustos do |t|
      t.string :nome_centrocusto
      t.text :desc_centrocusto
      t.references :user, index: true
      t.references :sivic_igreja, index: true

      t.timestamps
    end
  end
end
