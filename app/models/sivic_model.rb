class SivicModel < ActiveRecord::Base
	has_many:sivic_permissaos 
	belongs_to:sivic_modulo
end
