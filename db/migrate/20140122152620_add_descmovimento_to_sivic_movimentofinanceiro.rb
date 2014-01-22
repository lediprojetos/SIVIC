class AddDescmovimentoToSivicMovimentofinanceiro < ActiveRecord::Migration
  def change
   
    add_column :sivic_movimentofinanceiros, :DESC_movimento, :text

  end

end
