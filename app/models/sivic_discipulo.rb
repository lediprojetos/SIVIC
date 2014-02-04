class SivicDiscipulo < ActiveRecord::Base
  belongs_to :sivic_pessoa
  belongs_to :sivic_endereco
  belongs_to :sivic_profissao
  belongs_to :sivic_escolaridade
  belongs_to :sivic_rede
  belongs_to :sivic_celula

  belongs_to :UsuarioInclusao, :class_name => "User", :foreign_key => "NUMG_UsuarioInclusao"	
  belongs_to :UsuarioBloqueio, :class_name => "User", :foreign_key => "NUMG_UsuarioBloqueio"

  belongs_to :ProfissaoConjuge, :class_name => "SivicProfissao", :foreign_key => "NUMG_ProfissaoConjuge"

  SEXO = %w[FEMININO MASCULINO OUTROS]
  ESTADOCIVIL = %w[SOLTEIRO CASADO UNIAO_ESTAVEL OUTROS]

  validates :NUMR_CPF, :cpf => true
end
