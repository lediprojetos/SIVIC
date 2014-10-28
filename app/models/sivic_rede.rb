class SivicRede < ActiveRecord::Base
  belongs_to :sivic_igreja


  validates :nome_rede, :presence => {:message => 'Digite o nome da Rede'}


end
