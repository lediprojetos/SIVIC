class CreateSivicSituacaodiscipulos < ActiveRecord::Migration
  def change
    create_table :sivic_situacaodiscipulos do |t|
      t.references :sivic_igreja, index: true
      t.integer :user_inclusao, :integer, :references => :User, index: true
      t.integer :user_exclusao, :integer, :references => :User, index: true
      t.string :nome_situacao
      t.datetime :data_exclusao

      t.timestamps
    end
  end
end

