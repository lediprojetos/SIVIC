class SivicMovimentofinanceiro < ActiveRecord::Base
  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"	
  belongs_to :exclusao, :class_name => "User", :foreign_key => "user_exclusao" 
  belongs_to :sivic_tipmovfinanceiro
  belongs_to :sivic_evento

  has_one :sivic_partevento

end
