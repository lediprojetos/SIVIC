class CreateSivicPartevenrelacelulas < ActiveRecord::Migration
  def change
    create_table :sivic_partevenrelacelulas do |t|
      t.references :sivic_relatorioscelula, index: true
      t.references :sivic_participantecelula, index: true
      t.timestamps
    end
  end
end
