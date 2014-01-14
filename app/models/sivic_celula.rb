class SivicCelula < ActiveRecord::Base
  belongs_to :sivic_pessoa
  belongs_to :sivic_endereco

  DIAS = %w[SEGUNDA TERCA QUARTA QUINTA SEXTA SABADO DOMINGO]
end
