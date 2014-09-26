class RenameSivicDiscipulosDataNascimentoByHand < ActiveRecord::Migration
  def self.up
    rename_column :sivic_discipulos, :DATA_Nascimento, :data_nascimento
	#Primeiro Nome antigo, depois nome novo
  end

  def self.down
    rename_column :sivic_discipulos, :data_nascimento, :DATA_Nascimento    
    #Primeiro Nome novo, depois nome antigo
  end
end
