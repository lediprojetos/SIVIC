class SivicRelatorioscelula < ActiveRecord::Base
  belongs_to :sivic_celula
  has_many :sivic_partevenrelacelula
end
