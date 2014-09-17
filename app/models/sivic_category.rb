class SivicCategory < ActiveRecord::Base
  belongs_to :sivic_igreja
  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"	
  belongs_to :exclusao, :class_name => "User", :foreign_key => "user_exclusao" 

  has_many :children, :class_name => "SivicCategory", :foreign_key => "father_id"
  belongs_to :father, :class_name => "SivicCategory", :foreign_key => "father_id"


  validates :nome_categoria, :presence => { :message => 'Digite o nome da categoria' }


 #Gera codigo de discipulo
 before_create  :geraCodigo 
 after_create   :atualizaContador

 @@codigo 


  def  geraCodigo
    
    @@sivic_contcategory = SivicContcategory.find_by! sivic_igreja_id: self.sivic_igreja_id
    @@codigo = @@sivic_contcategory.numr_contador 
    @@codigo += 1
    self.numr_codigo  = @@codigo

   end 

   def  atualizaContador
      @@sivic_contcategory.update(:numr_contador => @@codigo)
   end

end
