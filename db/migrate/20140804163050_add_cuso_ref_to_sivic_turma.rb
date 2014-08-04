class AddCusoRefToSivicTurma < ActiveRecord::Migration
  def change
    add_reference :sivic_turmas, :sivic_curso, index: true
  end
end
