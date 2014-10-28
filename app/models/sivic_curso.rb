class SivicCurso < ActiveRecord::Base
  belongs_to :sivic_igreja
  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"


  validates :nome_curso, :presence => {:message => 'Digite o nome do Curso'}
 
 
end
