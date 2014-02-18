class SivicParticipantecelula < ActiveRecord::Base
    belongs_to :sivic_sitpartcelula

	#has_many :sivic_partevenrelacelula
	validates_uniqueness_of :DESC_Email, :scope => :NUMR_Telefone
end
