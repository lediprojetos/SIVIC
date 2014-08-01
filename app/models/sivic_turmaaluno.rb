class SivicTurmaaluno < ActiveRecord::Base
  belongs_to :sivic_turma
  belongs_to :sivic_pessoa
  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"	
  belongs_to :bloqueio, :class_name => "User", :foreign_key => "user_bloqueio" 
end
