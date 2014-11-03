#encoding: utf-8
class SivicMinisteriodiscipulo < ActiveRecord::Base

	belongs_to :sivic_discipulo
	belongs_to :sivic_ministerio

	belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"	
	belongs_to :exclusao, :class_name => "User", :foreign_key => "user_exclusao" 

	#validate :busca_ministerio_existente


	def busca_ministerio_existente
		errors.add(:sivic_ministerio_id, "Este ministério já encontra-se cadastrado.") if SivicMinisteriodiscipulo.where(:sivic_discipulo_id => self.sivic_discipulo_id, :sivic_ministerio_id => self.sivic_ministerio_id )
	end	

end
