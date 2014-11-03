class SivicPartevenrelacelula < ActiveRecord::Base
  belongs_to :sivic_relatorioscelula
  belongs_to :sivic_participantecelula
  belongs_to :sivic_sitpartcelula 

  validates_uniqueness_of :sivic_relatorioscelula, :scope => :sivic_participantecelula

end
