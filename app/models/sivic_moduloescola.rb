class SivicModuloescola < ActiveRecord::Base
  belongs_to :sivic_igreja
  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"	


  validates :nome_modulo, :presence => {:message => 'Digite o nome da disciplina'}
end
