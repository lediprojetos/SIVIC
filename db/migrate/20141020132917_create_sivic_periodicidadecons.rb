class CreateSivicPeriodicidadecons < ActiveRecord::Migration
  def change
    create_table :sivic_periodicidadecons do |t|
      t.string :desc_periodicidade
      t.integer :numr_qtddia
      t.references :sivic_igreja, index: true

      t.timestamps
    end
  end
end
