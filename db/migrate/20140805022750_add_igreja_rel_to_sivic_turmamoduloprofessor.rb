class AddIgrejaRelToSivicTurmamoduloprofessor < ActiveRecord::Migration
  def change
    add_reference :sivic_turmamoduloprofessors, :sivic_igreja, index: true
  end
end
