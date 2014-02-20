class AddSituacaoRefToSivicParticipantecelula < ActiveRecord::Migration
  def change
    add_reference :sivic_participantecelulas, :sivic_sitpartcelula, index: true
  end
end
