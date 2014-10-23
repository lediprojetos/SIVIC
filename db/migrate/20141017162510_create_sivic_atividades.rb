class CreateSivicAtividades < ActiveRecord::Migration
  def change
    create_table :sivic_atividades do |t|
      t.string :nome_atividade
      t.string :desc_atividade
      t.datetime :data_bloqueio
      t.datetime :data_exclusao
      t.references :sivic_periodicidadecon, index: true
      t.references :sivic_igreja, index: true
      t.integer :user_inclusao, :integer, :references => :User, index: true
      t.integer :user_bloqueio, :integer, :references => :User, index: true
      t.integer :user_exclusao, :integer, :references => :User, index: true

      t.timestamps
    end
  end
end
