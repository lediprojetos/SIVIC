class SivicIgreja < ActiveRecord::Base
        
  belongs_to :sivic_endereco, :dependent => :destroy
  has_many :sivic_situacaodiscipulo

  has_many :children, :class_name => "SivicIgreja", :foreign_key => "father_id"
  belongs_to :father, :class_name => "SivicIgreja", :foreign_key => "father_id"

  accepts_nested_attributes_for :sivic_endereco, allow_destroy: true

#  validates :sivic_cidade_id, :presence => { :message => ' - Escolha uma Cidade' }
after_create :inicia_contadores


	def inicia_contadores

		@SivicContdiscipulo = SivicContdiscipulo.new
		@SivicContdiscipulo.NUMR_Contador = 0
		@SivicContdiscipulo.sivic_igreja_id = self.id
		@SivicContdiscipulo.save

		@SivicContcelula = SivicContcelula.new
		@SivicContcelula.NUMR_Contador = 0
		@SivicContcelula.sivic_igreja_id = self.id
		@SivicContcelula.save

	end

end