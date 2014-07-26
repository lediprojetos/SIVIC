class SivicTurmamoduloprofessor < ActiveRecord::Base
  belongs_to :sivic_professors
  belongs_to :sivic_moduloescolas
  belongs_to :sivic_turmas
end
