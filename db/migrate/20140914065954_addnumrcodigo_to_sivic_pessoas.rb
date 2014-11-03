class AddnumrcodigoToSivicPessoas < ActiveRecord::Migration
  def change
  	    add_column :sivic_pessoas, :numr_codigo, :integer
  end
end
