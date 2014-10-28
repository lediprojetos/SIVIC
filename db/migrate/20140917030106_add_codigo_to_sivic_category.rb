class AddCodigoToSivicCategory < ActiveRecord::Migration
  def change
    add_column :sivic_categories, :numr_codigo, :integer
  end
end
