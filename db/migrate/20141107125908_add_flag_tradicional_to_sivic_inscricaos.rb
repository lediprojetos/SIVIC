class AddFlagTradicionalToSivicInscricaos < ActiveRecord::Migration
  def change
    add_column :sivic_inscricaos, :flag_tradicional, :boolean
  end
end
