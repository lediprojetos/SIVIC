class SivicIgreja < ActiveRecord::Base
  belongs_to :sivic_endereco

  has_many :children, :class_name => "sivic_igreja", :foreign_key => "father_id"
  belongs_to :father, :class_name => "sivic_igreja"

end
