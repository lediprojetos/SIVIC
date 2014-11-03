class SivicTipoEvento < ActiveRecord::Base
  belongs_to :sivic_igreja


  validates :desc_tipoevento, :presence => { :message => 'Digite o Tipo Evento' }
end
