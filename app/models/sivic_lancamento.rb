class SivicLancamento < ActiveRecord::Base
  
  belongs_to :sivic_contabanco
  belongs_to :sivic_category
  belongs_to :sivic_centrocusto
  belongs_to :sivic_rede
  belongs_to :sivic_tipmovfinanceiro
  belongs_to :sivic_pessoa
  belongs_to :sivic_fornecedor
  belongs_to :sivic_igreja
  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"	
  belongs_to :exclusao, :class_name => "User", :foreign_key => "user_exclusao" 



def self.fing_by_data_vencida

  self.where('data_vencimento >= ? and data_vencimento <= ?',session[:data_ini], session[:data_fim])

end

end
