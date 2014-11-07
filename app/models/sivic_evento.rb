class SivicEvento < ActiveRecord::Base
  belongs_to :User
  belongs_to :sivic_igreja
  belongs_to :sivic_tipo_evento
  belongs_to :sivic_endereco, :dependent => :destroy
  
  validates :sivic_tipo_evento_id, :presence => { :message => 'Escolha uma Tipo Evento' }
  validates :desc_evento, :presence => { :message => 'Digite um nome para o Evento' }
  validates :DATA_inicio, :presence => { :message => 'Digite a Data Inicio' }
  validates :DATA_fim, :presence => { :message => 'Digite a Data Fim' }


  accepts_nested_attributes_for :sivic_endereco, allow_destroy: true

  def self.find_by_name_or_all(query,sivic_igreja_id)

    if query
      self.where('desc_evento like ? and sivic_igreja_id = ?', "%#{query}%", sivic_igreja_id)
    else
      self.where(sivic_igreja_id: sivic_igreja_id)
    end    
  end
    
end
