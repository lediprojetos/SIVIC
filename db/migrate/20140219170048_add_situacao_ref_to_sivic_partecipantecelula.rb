class AddSituacaoRefToSivicPartecipantecelula < ActiveRecord::Migration
  def change
    add_reference :sivic_partecipantecelulas, :sivic_sitpartcelula, index: true
  end
end
