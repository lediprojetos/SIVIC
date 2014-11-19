class SivicParticipantecelula < ActiveRecord::Base
     belongs_to :sivic_sitpartcelula    
     belongs_to :sivic_celula
	#has_many :sivic_partevenrelacelula

	validates :nome_participante, :presence => { :message => 'Digite nome do participante' }



	#validates_uniqueness_of :DESC_Email, :scope => :NUMR_Telefone
	

end
