class SivicNotaaluno < ActiveRecord::Base
  belongs_to :sivic_licao
  belongs_to :sivic_turmaaluno
  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"	
end
