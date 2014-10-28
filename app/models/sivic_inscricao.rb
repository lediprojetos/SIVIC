#encoding: utf-8
class SivicInscricao < ActiveRecord::Base

	#Presence
	validates :nome_igreja, :presence => { :message => 'Digite um nome para a igreja.' }
	validates :nome_pessoa, :presence => { :message => 'Digite um nome para a pessoa.' }
	validates :numg_cidade, :presence => { :message => 'Escolha uma Cidade.' }
	validates :desc_telefone, :presence => { :message => 'Digite um telefone.' }
	validates :numg_cidade, :presence => { :message => 'Digite um telefone.' }
	validates :desc_email, :presence => { :message => 'Digite um email.' }
	validates :desc_confirmaemail, :presence => { :message => 'Digite a confirmação do email.' }
	validates :desc_senha, :presence => { :message => 'Digite a senha.' }
	validates :desc_confirmasenha, :presence => { :message => 'Digite a confirmação da senha.' }


	#iguality
		validate :check_email_and_confirmation
		validate :check_senha_and_confirmation
		validate :busca_email_existente

	#length
		validates_length_of :desc_senha, :minimum => 8, :maximum => 128, :message => "A senha deve ter entre 8 e 128 caracteres."
		validates_length_of :nome_igreja, :minimum => 4, :message => "O nome da igreja deve conter pelo menos 4 caracteres."
		validates_length_of :nome_pessoa, :minimum => 4, :message => "O nome da pessoa deve conter pelo menos 4 caracteres."

	#valid
		validates_length_of :desc_telefone, :minimum => 13, :message => "O telefone digitado não é válido."
		validates_format_of :desc_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :message => "O email digitado não é válido."

	def busca_email_existente
		errors.add(:desc_email, "Email já está sendo utilizado.") if User.find_by_email(self.desc_email)
	end		

	def check_email_and_confirmation
	  	errors.add(:desc_confirmaemail, "O email não foi confirmado corretamente.") if  self.desc_email != self.desc_confirmaemail
	end

	def check_senha_and_confirmation
	  	errors.add(:desc_confirmasenha, "A senha não foi confirmado corretamente.") if self.desc_senha != self.desc_confirmasenha
	end

end
