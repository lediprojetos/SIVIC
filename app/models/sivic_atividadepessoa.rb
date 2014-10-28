class SivicAtividadepessoa < ActiveRecord::Base
  belongs_to :sivic_atividade
  belongs_to :sivic_igreja 
  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"
  belongs_to :bloqueio, :class_name => "User", :foreign_key => "user_bloqueio" 	
  belongs_to :exclusao, :class_name => "User", :foreign_key => "user_exclusao"
  belongs_to :pessoaatividade, :class_name => "SivicPessoa", :foreign_key => "sivic_pessoaatividade"
  belongs_to :pessoaresponsavel, :class_name => "SivicPessoa", :foreign_key => "sivic_pessoaresponsavel"   

end
