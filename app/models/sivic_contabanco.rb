class SivicContabanco < ActiveRecord::Base
  belongs_to :sivic_banco
  belongs_to :sivic_igreja
  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"	
  belongs_to :exclusao, :class_name => "User", :foreign_key => "user_exclusao" 
end
