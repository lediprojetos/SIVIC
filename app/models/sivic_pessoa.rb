class SivicPessoa < ActiveRecord::Base
  belongs_to :sivic_igreja
  has_many :sivic_celula
  has_many   :User

  has_many :children, :class_name => "SivicPessoa", :foreign_key => "father_id"
  belongs_to :father, :class_name => "SivicPessoa"


  #validates :father_id, :presence => { :message => ' - Escolha um lider' }

before_create :setaParaConsolidador

#metodo para setar discipulo como consolidador quando tiver uma pessoa cadastrada debaixo dele
   def setaParaConsolidador  
    
    @pessoa = SivicPessoa.find(self.father_id)

    @discipulo = SivicDiscipulo.find_by! sivic_pessoa_id: @pessoa.id
   
   if @discipulo.FLAG_Consolidador = false
      @discipulo.update(:FLAG_Consolidador => true) 
   end 
    
   end

end
