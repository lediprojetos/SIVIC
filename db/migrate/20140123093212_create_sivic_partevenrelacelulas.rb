class CreateSivicPartevenrelacelulas < ActiveRecord::Migration
  def change
    create_table :sivic_partevenrelacelulas do |t|
      t.string :sivic_relatorioscelula
      t.references :sivic_relatorioscelula, index: true
      t.references :sivic_participantecelula, index: true
      t.string :DESC_SituacaoParticipante

      t.timestamps
    end
  end
end
