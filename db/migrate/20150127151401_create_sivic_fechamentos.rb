class CreateSivicFechamentos < ActiveRecord::Migration
  def change
    create_table :sivic_fechamentos do |t|
      t.references :sivic_igreja, index: true
      t.string :desc_fechamento
      t.decimal :valr_fechamento
      t.integer :tipo_fechamento
      t.datetime :data_fechamento
      t.datetime :data_exclusao
      t.integer :user_inclusao, :integer, :references => :User, index: true
      t.integer :user_exclusao, :integer, :references => :User, index: true      
      t.timestamps
    end
  end
end
