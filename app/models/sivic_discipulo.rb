class SivicDiscipulo < ActiveRecord::Base

  # - RELACIONAMENTOS
  belongs_to :sivic_pessoa
  belongs_to :sivic_endereco
  belongs_to :sivic_profissao
  belongs_to :sivic_escolaridade
  belongs_to :sivic_rede
  belongs_to :sivic_celula
  belongs_to :UsuarioInclusao, :class_name => "User", :foreign_key => "NUMG_UsuarioInclusao"	
  belongs_to :UsuarioBloqueio, :class_name => "User", :foreign_key => "NUMG_UsuarioBloqueio"
  belongs_to :ProfissaoConjuge, :class_name => "SivicProfissao", :foreign_key => "NUMG_ProfissaoConjuge"

  # - STRONG ATRIBUTES
  accepts_nested_attributes_for :sivic_pessoa, allow_destroy: true
  accepts_nested_attributes_for :sivic_endereco, allow_destroy: true

  # - Domínio
  SEXO = %w[FEMININO MASCULINO OUTROS]
  ESTADOCIVIL = %w[SOLTEIRO CASADO UNIAO_ESTAVEL OUTROS]

  # - Validações
  #validates :NUMR_CPF, :cpf => { :message => ' - Digite um CPF valido' }
  validates :sivic_profissao_id, :presence => { :message => ' - Escolha uma profissao' }
  #validates :sivic_pessoa_id, :presence => { :message => ' - Escolha um lider' }
  #validates :NUMR_CPF, uniqueness: true, uniqueness: {message: ' - CPF ja esta sendo utlizado'}
  #validates :sivic_endereco_id, :presence => { :message => ' - Informe um endereco' }
  validates :sivic_escolaridade_id, :presence => { :message => ' - Informe a escolaridade' }
  validates :sivic_rede_id, :presence => { :message => ' - Informe uma rede' }
  #validates :DATA_Nascimento, :presence => { :message => ' - Informe a data de nascimento' }
  #validates :NUMR_RG, :presence => { :message => ' - Informe o RG' }
  #validates :NUMR_RG, uniqueness: true, uniqueness: {message: ' - RG ja esta sendo utlizado'}


  #Gera codigo de discipulo 
  before_create  :geraCodigo
  after_create   :atualizaContador

  @@codigo 

  def self.find_by_name_or_all(query)
    if query
      self.joins('INNER JOIN sivic_pessoas sp on sivic_pessoa_id = sp.id').where('sp.NOME_pessoa like ?', "%#{query}%")
    else
      self.all
    end    
  end

  private

   def  geraCodigo
    
    @@sivic_contdiscipulo = SivicContdiscipulo.find_by! sivic_igreja_id: self.sivic_pessoa.sivic_igreja_id
    @@codigo = @@sivic_contdiscipulo.NUMR_Contador 
    @@codigo += 1
    self.NUMR_Codigo  = @@codigo

   end 
   
   def  atualizaContador
      @@sivic_contdiscipulo.update(:NUMR_Contador => @@codigo)
   end
  
end
