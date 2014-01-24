class CreateSivicParticipantecelulas < ActiveRecord::Migration
  def change
    create_table :sivic_participantecelulas do |t|
      t.string :NOME_Participante
      t.string :DESC_Email
      t.string :NUMR_Telefone
      t.string :DESC_SituacaoParticipante

      t.timestamps
    end
  end
end
