class AddCodigoToSivicDiscipulo < ActiveRecord::Migration
  def change
    add_column :sivic_discipulos, :NUMR_Codigo, :integer
  end
end
