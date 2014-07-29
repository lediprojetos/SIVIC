class CreateSivicTurmamoduloprofessors < ActiveRecord::Migration
  def change
    create_table :sivic_turmamoduloprofessors do |t|
      t.references :sivic_professor, index: true
      t.references :sivic_moduloescola, index: true
      t.references :sivic_turma, index: true
      t.timestamps
    end
  end
end
