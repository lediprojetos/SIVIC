class SivicProfissao < ActiveRecord::Base
	has_many :ProfissaoConjuge, :class_name => "SivicDiscipulo"
end
