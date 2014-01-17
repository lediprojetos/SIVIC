class SivicEvento < ActiveRecord::Base
  belongs_to :sivic_user
  belongs_to :sivic_igreja
  belongs_to :sivic_endereco
  belongs_to :sivic_tipo_evento
  
  accepts_nested_attributes_for :sivic_endereco, allow_destroy: true
end
