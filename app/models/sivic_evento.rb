class SivicEvento < ActiveRecord::Base
  belongs_to :User
  belongs_to :sivic_igreja
  belongs_to :sivic_endereco
  belongs_to :sivic_tipo_evento
  
  belongs_to :sivic_endereco, :dependent => :destroy
  
  accepts_nested_attributes_for :sivic_endereco, allow_destroy: true
end
