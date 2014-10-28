#encoding: utf-8
class SivicPessoa < ActiveRecord::Base
  attr_accessor :nome_discipulador

  belongs_to :sivic_igreja
  belongs_to :sivic_situacaodiscipulo
  has_many   :sivic_celula
  has_many   :User
  has_one    :sivic_professor
  has_many   :sivic_partevento

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


def nome_discipulador
  @nome_discipulador
end

# setter
def nome_discipulador=(val)
  @nome_discipulador = val
end

#metodo para setar discipulo como consolidador quando tiver uma pessoa cadastrada debaixo dele


  def self.find_by_name_or_all(query,sivic_igreja_id)
    
    if query
      query = query.downcase
      User.joins('INNER JOIN sivic_pessoas sp on sivic_pessoa_id = sp.id').where('lower(sp.NOME_pessoa) like ? and sp.sivic_igreja_id = ? and sp.data_exclusao is null', "%#{query}%", sivic_igreja_id).order('NOME_pessoa')
    else
      User.joins('INNER JOIN sivic_pessoas sp on sp.id = sivic_pessoa_id').where('sp.sivic_igreja_id = ? and sp.user_exclusao is null',sivic_igreja_id).order('NOME_pessoa')
    end    
  end


  def setaParaConsolidador  
    
      if self.sivic_igreja_id != 1
        if self.father_id && self.father_id != 0 
          
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
    
     if self.father_id && self.father_id != 0
      @sivic_discipulo = SivicDiscipulo.find_by! sivic_pessoa_id: self.father_id rescue nil
      if @sivic_discipulo
       errors.add(:father_id, "O líder escolhido não é um consolidador") if not @sivic_discipulo.flag_consolidador
      end
     end 
     
  end

end
