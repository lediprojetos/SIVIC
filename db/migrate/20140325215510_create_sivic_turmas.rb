class CreateSivicTurmas < ActiveRecord::Migration
  def change
    create_table :sivic_turmas do |t|
      t.references :sivic_igreja, index: true
      t.references :user, index: true
      t.references :user, index: true
      t.string :DESC_turma
      t.date :DATA_Inicio
      t.date :DATA_Fim
      t.integer :NUMR_QdtVagas
      t.date :DATA_bloqueio

      t.timestamps
    end
  end
end
