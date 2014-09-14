class SivicCelula < ActiveRecord::Base
  belongs_to :sivic_pessoa
  belongs_to :sivic_endereco, :dependent => :destroy
  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"	
  belongs_to :bloqueio, :class_name => "User", :foreign_key => "user_bloqueio" 

  has_many :sivic_participantecelula

  accepts_nested_attributes_for :sivic_endereco, allow_destroy: true

  has_many :sivic_relatorioscelula, :dependent => :destroy

  # - Domínios
  DIAS = %w[SEGUNDA-FEIRA TERCA-FEIRA QUARTA-FEIRA QUINTA-FEIRA SEXTA-FEIRA SABADO DOMINGO]
  SEXO = %w[MASCULINO FEMININO OUTROS]


  validates :sivic_pessoa_id, :presence => { :message => 'Escolha o lider de celula' }



 #Gera codigo de celula
 

  #before_create  :geraCodigo
  after_create   :atualizaContador

  @@codigo 

  private

   def  geraCodigo
    @@sivic_contcelula = SivicContcelula.find_by! sivic_igreja_id: self.inclusao.sivic_pessoa.sivic_igreja_id
    @@codigo = @@sivic_contcelula.NUMR_Contador 
    @@codigo += 1
    self.NUMR_Codigo  = @@codigo
   end 
   
   def  atualizaContador
      @@sivic_contcelula.update(:NUMR_Contador => @@codigo)
   end

end
