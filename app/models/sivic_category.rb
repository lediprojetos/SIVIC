class SivicCategory < ActiveRecord::Base
  belongs_to :sivic_igreja
  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"	
  belongs_to :exclusao, :class_name => "User", :foreign_key => "user_exclusao" 

  has_many :children, :class_name => "SivicCategory", :foreign_key => "father_id"
  belongs_to :father, :class_name => "SivicCategory", :foreign_key => "father_id"


  validates :nome_categoria, :presence => { :message => 'Digite o nome da categoria' }


end
