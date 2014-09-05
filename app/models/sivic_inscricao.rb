#encoding: utf-8
class SivicInscricao < ActiveRecord::Base

#Presence
validates :nome_igreja, :presence => { :message => ' - Digite um nome para a igreja.' }
validates :nome_pessoa, :presence => { :message => ' - Digite um nome para a pessoa.' }
validates :numg_cidade, :presence => { :message => ' - Escolha uma Cidade.' }
validates :desc_telefone, :presence => { :message => ' - Digite um telefone.' }
validates :numg_cidade, :presence => { :message => ' - Digite um telefone.' }
validates :desc_email, :presence => { :message => ' - Digite um email.' }
validates :desc_confirmaemail, :presence => { :message => ' - Digite a confirmação do email.' }
validates :desc_senha, :presence => { :message => ' - Digite a senha.' }
validates :desc_confirmasenha, :presence => { :message => ' - Digite a confirmação da senha.' }

#iguality
validate :check_email_and_confirmation

def check_email_and_confirmation
  	errors.add(:desc_confirmaemail, "O email não foi confirmado corretamente.") if :desc_email != :desc_confirmaemail
end

end
