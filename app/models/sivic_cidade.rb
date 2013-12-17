class SivicCidade < ActiveRecord::Base
  belongs_to :sivic_estado

	validates :nome_cidade, :presence => true, :length => { :minimum => 3 }
   	validates :nome_cidade, :presence => true  
end
