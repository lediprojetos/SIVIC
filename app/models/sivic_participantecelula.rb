class SivicParticipantecelula < ActiveRecord::Base    
	#has_many :sivic_partevenrelacelula
	validates_uniqueness_of :DESC_Email, :scope => :NUMR_Telefone
end
