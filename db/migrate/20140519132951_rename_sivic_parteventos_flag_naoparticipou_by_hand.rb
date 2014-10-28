class RenameSivicParteventosFlagNaoparticipouByHand < ActiveRecord::Migration
   def self.up
    rename_column :sivic_parteventos, :FLAG_naoparticipou, :flag_naoparticipou #Primeiro Nome antigo, depois nome novo
  end

  def self.down
    rename_column :sivic_parteventos, :flag_naoparticipou, :FLAG_naoparticipou #Primeiro Nome novo, depois nome antigo
  end
end
