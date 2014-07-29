class SivicTurmamoduloprofessor < ActiveRecord::Base
  belongs_to :sivic_professor
  belongs_to :sivic_moduloescola
  belongs_to :sivic_turma
end
