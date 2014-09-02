class SivicMinisteriodiscipulo < ActiveRecord::Base
  belongs_to :sivic_discipulo
  belongs_to :sivic_ministerio

   belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"	
  belongs_to :exclusao, :class_name => "User", :foreign_key => "user_exclusao" 
end
