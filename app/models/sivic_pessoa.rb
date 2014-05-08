class SivicPessoa < ActiveRecord::Base
  belongs_to :sivic_igreja
  has_many :sivic_celula
  has_many   :User

  has_many :children, :class_name => "SivicPessoa", :foreign_key => "father_id"
  belongs_to :father, :class_name => "SivicPessoa"


  #validates :father_id, :presence => { :message => ' - Escolha um lider' }

before_create :setaParaConsolidador

   def setaParaConsolidador  
    
    @pessoa = SivicPessoa.find(self.father_id)


    @discipulo = SivicDiscipulo.find_by! sivic_pessoa_id: @pessoa.id
   #@@sivic_contdiscipulo = SivicContdiscipulo.find_by! sivic_igreja_id: self.sivic_pessoa.sivic_igreja_id

   #@discipulo = SivicDiscipulo.new
   #@discipulo = SivicDiscipulo.where(:sivic_pessoa_id => @pessoa.id)

    #debugger
    
    #@discipulo.FLAG_Consolidador = true    
    #@discipulo.update
    
    @discipulo.update(:FLAG_Consolidador => true)

   end

end
