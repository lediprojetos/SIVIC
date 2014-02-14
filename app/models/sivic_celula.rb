class SivicCelula < ActiveRecord::Base
  belongs_to :sivic_pessoa
  belongs_to :sivic_endereco, :dependent => :destroy

  accepts_nested_attributes_for :sivic_endereco, allow_destroy: true

  has_many :sivic_relatorioscelula

  # - Domínios
  DIAS = %w[SEGUNDA-FEIRA TERCA-FEIRA QUARTA-FEIRA QUINTA-FEIRA SEXTA-FEIRA SABADO DOMINGO]
  SEXO = %w[FEMININO MASCULINO OUTROS]

end
