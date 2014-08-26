class SivicMinisterio < ActiveRecord::Base
  belongs_to :sivic_igreja


 validates :nome_ministerio, :presence => { :message => 'Digite o nome do ministerio' }
 validates :sigl_ministerio, :presence => { :message => 'Digite a SIGLA para o ministerio' }
 	
end
