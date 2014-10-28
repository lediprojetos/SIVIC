#encoding: utf-8
class SivicIgreja < ActiveRecord::Base
        
  belongs_to :sivic_endereco, :dependent => :delete

  belongs_to :sivic_plano

  has_many :sivic_situacaodiscipulo, :dependent => :destroy
   

  has_many :children, :class_name => "SivicIgreja", :foreign_key => "father_id"
  belongs_to :father, :class_name => "SivicIgreja", :foreign_key => "father_id"

 accepts_nested_attributes_for :sivic_endereco, allow_destroy: true

#  validates :sivic_cidade_id, :presence => { :message => ' - Escolha uma Cidade' }
after_create :inicia_conf_padrao


 def inicia_conf_padrao

 	inicia_contadores()
 	inicia_categoria()

 end


def inicia_contadores

	@SivicContdiscipulo = SivicContdiscipulo.new
	@SivicContdiscipulo.NUMR_Contador = 0
	@SivicContdiscipulo.sivic_igreja_id = self.id
	@SivicContdiscipulo.save

	@SivicContcelula = SivicContcelula.new
	@SivicContcelula.NUMR_Contador = 0
	@SivicContcelula.sivic_igreja_id = self.id
	@SivicContcelula.save

	@SivicContCategory = SivicContcategory.new
	@SivicContCategory.numr_contador = 0
	@SivicContCategory.sivic_igreja_id = self.id
	@SivicContCategory.save		

end

def inicia_categoria

	@sivic_category = SivicCategory.new
	@sivic_category.nome_categoria = 'Dízimo'
    @sivic_category.sivic_igreja_id = self.id
    @sivic_category.save    

    @sivic_category1 = SivicCategory.new
	@sivic_category1.nome_categoria = 'Oferta'
    @sivic_category1.sivic_igreja_id = self.id
    @sivic_category1.save
end


end