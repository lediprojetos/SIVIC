class AddRedeToSivicDiscipulo < ActiveRecord::Migration
  def change
    add_column :sivic_discipulos, :rede_conversao, :integer, references: :sivic_redes
   
  end
end
