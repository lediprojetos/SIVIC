class SivicAlunoaula < ActiveRecord::Base
  belongs_to :sivic_turmaaluno
  belongs_to :sivic_aula
end
