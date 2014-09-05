class AddDescConfirmaemailToSivicInscricaos < ActiveRecord::Migration
  def change
    add_column :sivic_inscricaos, :desc_confirmaemail, :string
  end
end
