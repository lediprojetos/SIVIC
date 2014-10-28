class RenameSivicParticipantescelulasNomeParticipanteByHand < ActiveRecord::Migration
   def self.up
    rename_column :sivic_participantecelulas, :NOME_Participante, :nome_participante #Primeiro Nome antigo, depois nome novo
  end

  def self.down
    rename_column :sivic_participantecelulas, :nome_participante, :NOME_Participante #Primeiro Nome novo, depois nome antigo
  end
end
