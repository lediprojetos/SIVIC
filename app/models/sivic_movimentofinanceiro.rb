class SivicMovimentofinanceiro < ActiveRecord::Base
  belongs_to :user_inclusao, :class_name => "User", :foreign_key => "user_inclusao"
  belongs_to :user_exclusao, :class_name => "User", :foreign_key => "user_exclusao" 
  belongs_to :sivic_tipmovfinanceiro
  belongs_to :sivic_evento

end
