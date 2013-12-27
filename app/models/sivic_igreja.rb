class SivicIgreja < ActiveRecord::Base
	
  belongs_to :sivic_endereco, :dependent => :destroy

  has_many :children, :class_name => "sivic_igreja", :foreign_key => "father_id"
  belongs_to :father, :class_name => "sivic_igreja"

  accepts_nested_attributes_for :sivic_endereco, allow_destroy: true
end
