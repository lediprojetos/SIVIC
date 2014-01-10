class SivicPessoa < ActiveRecord::Base
  belongs_to :sivic_igreja
  belongs_to :User

  has_many :children, :class_name : "SivicPessoa", :foreign_key => "father_id"
  belongs_to :father, :class_name : "SivicPessoa"

end
