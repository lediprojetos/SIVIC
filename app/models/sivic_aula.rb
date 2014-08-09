class SivicAula < ActiveRecord::Base
  belongs_to :sivic_igreja
  belongs_to :sivic_tumamoduloprofessor
  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"	
end
