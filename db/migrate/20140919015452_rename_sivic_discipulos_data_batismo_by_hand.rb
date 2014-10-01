class RenameSivicDiscipulosDataBatismoByHand < ActiveRecord::Migration
  def self.up
    rename_column :sivic_discipulos, :DATA_Batismo, :data_batismo
	#Primeiro Nome antigo, depois nome novo
  end

  def self.down
    rename_column :sivic_discipulos, :data_batismo, :DATA_Batismo    
    #Primeiro Nome novo, depois nome antigo
  end
end
