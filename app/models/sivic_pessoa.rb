#encoding: utf-8
class SivicPessoa < ActiveRecord::Base
  belongs_to :sivic_igreja
  belongs_to :sivic_situacaodiscipulo
  has_many   :sivic_celula
  has_many   :User
  has_one   :sivic_professor

  has_many :children, :class_name => "SivicPessoa", :foreign_key => "father_id"
  belongs_to :father, :class_name => "SivicPessoa"


validates :nome_pessoa, :presence => { :message => 'Informe um Nome.' }
#validates :father_id, :presence => { :message => 'Escolha um lider.' }


validate :valida_lider_consolidador

before_create :setaParaConsolidador

#Gera codigo de discipulo
before_create  :geraCodigo 
after_create   :atualizaContador

 @@codigo 

#metodo para setar discipulo como consolidador quando tiver uma pessoa cadastrada debaixo dele

  def setaParaConsolidador  
    
      if self.sivic_igreja_id != 1
        if self.father_id != nil  
          
            @pessoa = SivicPessoa.find(self.father_id)

            @discipulo = SivicDiscipulo.find_by! sivic_pessoa_id: @pessoa.id rescue nil
          
          if @discipulo != nil
               if @discipulo.flag_consolidador == false
                  @discipulo.update(:flag_consolidador => true) 
               end

          end  
     
       end
     end
   end


    def  geraCodigo
    
    @@sivic_contdiscipulo = SivicContdiscipulo.find_by! sivic_igreja_id: self.sivic_igreja_id
    @@codigo = @@sivic_contdiscipulo.NUMR_Contador 
    @@codigo += 1
    self.numr_codigo  = @@codigo

   end 

   def  atualizaContador
      @@sivic_contdiscipulo.update(:NUMR_Contador => @@codigo)
   end


   def valida_lider_consolidador
    
      @sivic_discipulo = SivicDiscipulo.find_by! sivic_pessoa_id: self.father_id
      errors.add(:father_id, "O líder escolhido não é um consolidador") if not @sivic_discipulo.flag_consolidador

  end

end
