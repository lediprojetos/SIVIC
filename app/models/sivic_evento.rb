class SivicEvento < ActiveRecord::Base
  belongs_to :sivic_user
  belongs_to :sivic_igreja
  belongs_to :sivic_endereco
  belongs_to :sivic_tipoEvento
end