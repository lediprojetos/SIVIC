class SivicPartevento < ActiveRecord::Base
  belongs_to :sivic_pessoa
  belongs_to :sivic_evento
  belongs_to :sivic_movimentofinanceiro

   accepts_nested_attributes_for :sivic_movimentofinanceiro, allow_destroy: true
end
