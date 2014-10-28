class SivicEndereco < ActiveRecord::Base
  belongs_to :sivic_cidade
  has_one :sivic_igreja, :dependent => :destroy
  has_one :sivic_celula


  validates :sivic_cidade_id, :presence => { :message => 'Escolha um estado e uma cidade.' }

  before_validation :retiraMascara

def retiraMascara

	if self.NUMR_Cep
		self.NUMR_Cep.gsub!(/[^0-9]/, '')
	end

end

end