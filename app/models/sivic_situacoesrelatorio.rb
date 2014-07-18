class SivicSituacoesrelatorio < ActiveRecord::Base
	has_many :sivic_relatorioscelulas


# Criar metodo para cadastro movimento financiero
# Regras: Quando o sivic_situacoesrelatorio_id = 3 então deve inserir um novo movimento financeiro
# com o valor do relatorio, pegar o id do movimento financeiro e inserir no relatorio

#esse metedo deve funcionar na alteração do relatorio


end



