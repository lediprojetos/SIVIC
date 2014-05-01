class SivicEndereco < ActiveRecord::Base
  belongs_to :sivic_cidade
  has_one :sivic_igreja
  has_one :sivic_celula


  validates :sivic_cidade_id, :presence => { :message => ' - Escolha uma Cidade' }

  before_validation :retiraMascara

def retiraMascara

	self.NUMR_Cep.gsub!(/[^0-9]/, '')

end

end