#encoding: utf-8
class SivicPartevento < ActiveRecord::Base
  belongs_to :sivic_pessoa
  belongs_to :sivic_evento
  belongs_to :sivic_movimentofinanceiro, :dependent => :destroy
  belongs_to :convidou, :class_name => "SivicPessoa", :foreign_key => "pessoa_convidou"

  validates :sivic_pessoa_id, :presence => { :message => 'Escolha uma pessoa!' }
  validates :sivic_evento_id, :presence => { :message => 'Escolha uma evento!' }
  #validates :flag_passando, :presence => { :message => 'É necessário informar se está Passando ou Servindo!' }

  accepts_nested_attributes_for :sivic_movimentofinanceiro, allow_destroy: true


end
