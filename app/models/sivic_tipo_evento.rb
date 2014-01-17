class SivicTipoEvento < ActiveRecord::Base
  belongs_to :sivic_igreja
  has_many :sivic_evento
end
