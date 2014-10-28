class SivicEstado < ActiveRecord::Base
	has_many :sivic_cidade, :dependent => :destroy
	#validates :sivic_cidade, :presence => true


before_destroy  :validate_destroy 

def validate_destroy
	if SivicCidade.find_by_sivic_estado_id(id)
	  errors.add :base, "Cannot delete booking with payments"
	  false
  	else
  		return true
	end
end

end
