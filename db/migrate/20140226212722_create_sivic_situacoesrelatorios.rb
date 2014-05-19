class CreateSivicSituacoesrelatorios < ActiveRecord::Migration
  def change
    create_table :sivic_situacoesrelatorios do |t|
      t.string :DESC_Situacao

      t.timestamps
    end

    	SivicSituacoesrelatorio.create(:DESC_Situacao => "ENVIADO")
	    SivicSituacoesrelatorio.create(:DESC_Situacao => "PENDENTE")
	    SivicSituacoesrelatorio.create(:DESC_Situacao => "RECEBIDO")  
	    SivicSituacoesrelatorio.create(:DESC_Situacao => "ATRASADO")
	    SivicSituacoesrelatorio.create(:DESC_Situacao => "DISPONIVEL")  
  end
end
