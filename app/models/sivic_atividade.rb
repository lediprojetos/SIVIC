class SivicAtividade < ActiveRecord::Base
  belongs_to :sivic_periodicidadecon
  belongs_to :sivic_igreja
  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"
  belongs_to :bloqueio, :class_name => "User", :foreign_key => "user_bloqueio" 	
  belongs_to :exclusao, :class_name => "User", :foreign_key => "user_exclusao" 


  validates :nome_atividade, :presence => { :message => 'Digite o nome da atividade' }
  

end
