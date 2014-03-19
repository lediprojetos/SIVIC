class SivicProfessor < ActiveRecord::Base
  belongs_to :sivic_pessoa
  belongs_to :user
  belongs_to :user
end
