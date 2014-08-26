class SivicPartevento < ActiveRecord::Base
  belongs_to :sivic_pessoa
  belongs_to :sivic_evento
  belongs_to :sivic_movimentofinanceiro, :dependent => :destroy

  validates :sivic_pessoa_id, :presence => { :message => ' - Escolha uma pessoa!' }
  validates :sivic_evento_id, :presence => { :message => ' - Escolha uma evento!' }

  accepts_nested_attributes_for :sivic_movimentofinanceiro, allow_destroy: true


end
