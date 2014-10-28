#encoding: utf-8
class SivicPeriodicidadecon < ActiveRecord::Base
  belongs_to :sivic_igreja


 validates :desc_periodicidade, :presence => { :message => 'Digite a descrição' }
 validates :numr_qtddia, :presence => { :message => 'Digite a quantidade de dias' }

end
