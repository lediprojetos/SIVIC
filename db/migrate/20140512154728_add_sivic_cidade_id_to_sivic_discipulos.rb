class AddSivicCidadeIdToSivicDiscipulos < ActiveRecord::Migration
  def change
    add_column :sivic_discipulos, :sivic_cidade_id, :integer
  end
end
