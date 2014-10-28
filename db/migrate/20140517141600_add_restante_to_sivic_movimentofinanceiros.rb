class AddRestanteToSivicMovimentofinanceiros < ActiveRecord::Migration
  def change
    add_column :sivic_movimentofinanceiros, :valr_restante, :decimal
  end
end
