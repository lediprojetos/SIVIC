class SivicPartevento < ActiveRecord::Base
  belongs_to :sivic_pessoa
  belongs_to :sivic_evento
  belongs_to :sivic_movimentofinanceiro
end
