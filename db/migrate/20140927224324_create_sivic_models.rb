class CreateSivicModels < ActiveRecord::Migration
  def change
    create_table :sivic_models do |t|
      t.string :nome_model
      t.string :desc_model
      t.datetime :data_bloqueio

      t.timestamps
    end
  end
end
