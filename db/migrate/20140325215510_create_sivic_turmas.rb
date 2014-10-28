class CreateSivicTurmas < ActiveRecord::Migration
  def change
    create_table :sivic_turmas do |t|
      t.references :sivic_igreja, index: true
      t.integer :user_inclusao, :integer, :references => :User, index: true
      t.string :DESC_turma
      t.date :DATA_Inicio
      t.date :DATA_Fim
      t.integer :NUMR_QdtVagas
      t.date :DATA_bloqueio
      t.integer :user_bloqueio, :integer, :references => :User, index: true
      t.timestamps
    end
  end
end
