class AddDataPagamentoToSivicLancamentos < ActiveRecord::Migration
  def change
    add_column :sivic_lancamentos, :data_pagamento, :date
  end
end
