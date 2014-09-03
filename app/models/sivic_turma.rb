class SivicTurma < ActiveRecord::Base
  belongs_to :sivic_igreja
  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"	
  belongs_to :bloqueio, :class_name => "User", :foreign_key => "user_bloqueio" 
  belongs_to :sivic_curso


  validates :DESC_turma, :presence =>{ :message => 'Digite a descricao da turma'}

end
