class SivicDiscipulo < ActiveRecord::Base

  # - RELACIONAMENTOS
  belongs_to :sivic_cidade
  belongs_to :sivic_pessoa
  belongs_to :sivic_endereco
  belongs_to :sivic_profissao
  belongs_to :sivic_escolaridade
  belongs_to :sivic_rede
  belongs_to :sivic_celula
  belongs_to :UsuarioInclusao, :class_name => "User", :foreign_key => "NUMG_UsuarioInclusao"	
  belongs_to :UsuarioBloqueio, :class_name => "User", :foreign_key => "NUMG_UsuarioBloqueio"
  belongs_to :ProfissaoConjuge, :class_name => "SivicProfissao", :foreign_key => "NUMG_ProfissaoConjuge"
  belongs_to :redeConversao, :class_name => "SivicRede", :foreign_key => "rede_conversao"

  # - STRONG ATRIBUTES
  accepts_nested_attributes_for :sivic_pessoa, allow_destroy: true
  accepts_nested_attributes_for :sivic_endereco, allow_destroy: true

  # - Domínio
  SEXO = %w[FEMININO MASCULINO]
  ESTADOCIVIL = %w[SOLTEIRO CASADO UNIAO_ESTAVEL OUTROS]
  DIAS = %w[SEGUNDA-FEIRA TERCA-FEIRA QUARTA-FEIRA QUINTA-FEIRA SEXTA-FEIRA SABADO DOMINGO]

  # - Validações
  #validates :NUMR_CPF, :cpf => { :message => ' - Digite um CPF valido' }
  #validates :sivic_profissao_id, :presence => { :message => ' - Escolha uma profissao' }
  #validates :sivic_pessoa_id, presence: true
  #validates :NUMR_CPF, uniqueness: true, uniqueness: {:message => 'ja esta sendo utlizado.'}
  #validates :sivic_endereco_id, :presence => { :message => 'Informe um endereco.' }
  #validates :sivic_escolaridade_id, :presence => { :message => ' - Informe a escolaridade' }
  #validates :sivic_rede_id, :presence => { :message => ' - Informe uma rede.' }
  #validates :data_nascimento, :presence => { :message => ' - Informe a data de nascimento' }
  #validates :NUMR_RG, :presence => { :message => ' - Informe o RG' }
  #validates :NUMR_RG, uniqueness: true, uniqueness: {message: ' - RG ja esta sendo utlizado'}


  before_destroy :capitura_pessoa
  after_destroy  :deleta_pessoa

  before_validation :retiraMascara

  @@codigo 
  @@pessoa 

  def self.find_by_name_or_all(query,sivic_igreja_id)
    
    if query
      query = query.downcase
       SivicPessoa.where('lower(nome_pessoa) like ? and sivic_igreja_id = ? and data_exclusao is null', "%#{query}%", sivic_igreja_id).order('NOME_pessoa')   
     # self.joins('LEFT JOIN sivic_pessoas sp on sivic_pessoa_id = sp.id').where('lower(sp.NOME_pessoa) like ? and sp.sivic_igreja_id = ? and sp.data_exclusao is null', "%#{query}%", sivic_igreja_id).order('NOME_pessoa')
    else
      SivicPessoa.where('sivic_igreja_id = ? and user_exclusao is null',sivic_igreja_id).order('NOME_pessoa')
     # self.joins('LEFT JOIN sivic_pessoas sp on sivic_pessoa_id = sp.id').where('sp.sivic_igreja_id = ? and sp.user_exclusao is null',sivic_igreja_id).order('NOME_pessoa')
    end    
  end

 def self.find_disc_by_name_or_all(query,sivic_igreja_id)
    
    if query
      query = query.downcase
     
      self.joins('LEFT JOIN sivic_pessoas sp on sivic_pessoa_id = sp.id').where('lower(sp.NOME_pessoa) like ? and sp.sivic_igreja_id = ? and sp.data_exclusao is null', "%#{query}%", sivic_igreja_id).order('NOME_pessoa')
    else
     
       self.joins('LEFT JOIN sivic_pessoas sp on sivic_pessoa_id = sp.id').where('sp.sivic_igreja_id = ? and sp.user_exclusao is null',sivic_igreja_id).order('NOME_pessoa')
    end    
  end


  def self.find_by_rel(query,sivic_igreja_id)    
    if query
      query = query.downcase
      self.joins('INNER JOIN sivic_pessoas sp on sivic_pessoa_id = sp.id').where('lower(sp.NOME_pessoa) like ? and sp.sivic_igreja_id = ?', "%#{query}%", sivic_igreja_id).order('NOME_pessoa')
    end    
  end  

  private

  def retiraMascara
      self.NUMR_CPF.gsub!(/[^0-9]/, '')
  end

  def deleta_pessoa
       @@pessoa.destroy  
  end

  def capitura_pessoa
       @@pessoa  = SivicPessoa.find(self.sivic_pessoa_id)      
  end
  
  
end
