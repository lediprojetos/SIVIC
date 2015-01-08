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


 def self.find_by_name_or_all(query,sivic_igreja_id)
    
    if query
      query = query.downcase     
       #SivicPessoa.where('lower(nome_pessoa) like ? and sivic_igreja_id = ? and data_exclusao is null', "%#{query}%", sivic_igreja_id).order('NOME_pessoa')
       #SivicCelula.where('lower(nome_pessoa) like ? and sivic_igreja_id = ? and data_exclusao is null', "%#{query}%", sivic_igreja_id).order('NOME_pessoa')
      self.joins('LEFT JOIN sivic_pessoas sp on sivic_pessoa_id = sp.id').where('lower(sp.NOME_pessoa) like ? and sp.sivic_igreja_id = ? and (flag_naoparticipou is null or flag_naoparticipou = false)', "%#{query}%", sivic_igreja_id).order('NOME_pessoa')
    else
      #SivicPessoa.where('sivic_igreja_id = ? and user_exclusao is null',sivic_igreja_id).order('NOME_pessoa')
      self.joins('LEFT JOIN sivic_pessoas sp on sivic_pessoa_id = sp.id').where('sp.sivic_igreja_id = ? and sp.user_exclusao is null',sivic_igreja_id).order('NOME_pessoa')
    end    
 end

end
