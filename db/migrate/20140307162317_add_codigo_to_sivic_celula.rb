class AddCodigoToSivicCelula < ActiveRecord::Migration
  def change
    add_column :sivic_celulas, :NUMR_Codigo, :integer
  end
end
