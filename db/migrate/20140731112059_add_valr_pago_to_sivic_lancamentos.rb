class AddValrPagoToSivicLancamentos < ActiveRecord::Migration
  def change
    add_column :sivic_lancamentos, :valr_pago, :decimal
  end
end
