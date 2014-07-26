class CreateSivicTurmamoduloprofessors < ActiveRecord::Migration
  def change
    create_table :sivic_turmamoduloprofessors do |t|
      t.references :sivic_professors, index: true
      t.references :sivic_moduloescolas, index: true
      t.references :sivic_turmas, index: true

      t.timestamps
    end
  end
end
