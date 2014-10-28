class Observacoesrelatorio < ActiveRecord::Base
  belongs_to :sivic_relatorioscelula
  belongs_to :sivic_pessoa
end
