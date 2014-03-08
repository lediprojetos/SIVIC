class SivicIgreja < ActiveRecord::Base
        
  belongs_to :sivic_endereco, :dependent => :destroy

  has_many :children, :class_name => "SivicIgreja", :foreign_key => "father_id"
  belongs_to :father, :class_name => "SivicIgreja", :foreign_key => "father_id"

  accepts_nested_attributes_for :sivic_endereco, allow_destroy: true

#  validates :sivic_cidade_id, :presence => { :message => ' - Escolha uma Cidade' }



end