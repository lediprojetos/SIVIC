class SivicPessoa < ActiveRecord::Base
  belongs_to :sivic_igreja
  has_many :sivic_celula
  has_many   :User

  has_many :children, :class_name => "SivicPessoa", :foreign_key => "father_id"
  belongs_to :father, :class_name => "SivicPessoa"


  #validates :father_id, :presence => { :message => ' - Escolha um lider' }

end
