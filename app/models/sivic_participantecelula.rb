class SivicParticipantecelula < ActiveRecord::Base
     belongs_to :sivic_sitpartcelula    
     belongs_to :sivic_celula
	#has_many :sivic_partevenrelacelula
	validates_uniqueness_of :DESC_Email, :scope => :NUMR_Telefone
	validates :sivic_celula_id, :presence => true  

end
