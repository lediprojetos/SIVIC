class SivicContabanco < ActiveRecord::Base
  belongs_to :sivic_banco
  belongs_to :sivic_igreja
  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"	
  belongs_to :exclusao, :class_name => "User", :foreign_key => "user_exclusao" 


  validates :nome_conta, :presence => { :message => 'Digite o nome da conta' }
  validates :sivic_banco_id, :presence => { :message => 'Selecione um Banco' }
  validates :numr_conta, :presence => { :message => 'Digite o numero da conta' }
  validates :numr_dvconta, :presence => { :message => 'Digite o Dv da conta' }
  validates :numr_agencia, :presence => { :message => 'Digite a Agencia'}


end
