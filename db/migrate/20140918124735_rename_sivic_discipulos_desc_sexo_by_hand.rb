class RenameSivicDiscipulosDescSexoByHand < ActiveRecord::Migration
  def self.up
    rename_column :sivic_discipulos, :DESC_Sexo, :desc_sexo
    rename_column :sivic_discipulos, :DESC_EstadoCivil, :desc_estadocivil
    rename_column :sivic_discipulos, :FLAG_Discipulo, :flag_discipulo
    rename_column :sivic_discipulos, :FLAG_Discipulador, :flag_discipulador
    rename_column :sivic_discipulos, :FLAG_Consolidador, :flag_consolidador
    #rename_column :sivic_discipulos, :DATA_Batismo, :data_batismo
	#Primeiro Nome antigo, depois nome novo
  end

  def self.down
    rename_column :sivic_pessoas, :desc_sexo, :DESC_Sexo 
    rename_column :sivic_discipulos, :desc_estadocivil, :DESC_EstadoCivil
    rename_column :sivic_discipulos, :flag_discipulo, :FLAG_Discipulo
    rename_column :sivic_discipulos, :flag_discipulador, :FLAG_Discipulador
    rename_column :sivic_discipulos, :flag_consolidador, :FLAG_Consolidador
    #rename_column :sivic_discipulos, :data_batismo, :DATA_Batismo    
    #Primeiro Nome novo, depois nome antigo
  end
end
