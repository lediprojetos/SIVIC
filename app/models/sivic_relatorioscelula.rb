class SivicRelatorioscelula < ActiveRecord::Base
  belongs_to :sivic_celula
  has_many :sivic_partevenrelacelula
  belongs_to :sivic_situacoesrelatorio



# Criar metodo para cadastro movimento financiero
# Regras: Quando o sivic_situacoesrelatorio_id = 3 então deve inserir um novo movimento financeiro
# com o valor do relatorio, pegar o id do movimento financeiro e inserir no relatorio

#esse metedo deve funcionar na alteração do relatorio

before_save :movimento_financeiro



def movimento_financeiro

 if self.sivic_situacoesrelatorio_id = 3
   #colocar regra aqui para incluir movimento e depois salvar o id no relatorio

 end
 		 	
end


end
