class AddSituacaoRefToSivicPartevenrelacelula < ActiveRecord::Migration
  def change
    add_reference :sivic_partevenrelacelulas, :sivic_sitpartcelula, index: true
  end
end
