class SivicBanco < ActiveRecord::Base

 validates :nome_banco, :presence => { :message => 'Digite o nome do banco' }

end
