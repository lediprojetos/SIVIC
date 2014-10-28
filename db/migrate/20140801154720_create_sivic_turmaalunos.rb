class CreateSivicTurmaalunos < ActiveRecord::Migration
  def change
    create_table :sivic_turmaalunos do |t|
      t.references :sivic_turma, index: true
      t.references :sivic_pessoa, index: true
      t.integer :user_inclusao, :integer, :references => :User, index: true 
      t.integer :user_bloqueio, :integer, :references => :User, index: true
      t.date :data_bloqueio

      t.timestamps
    end
  end
end
