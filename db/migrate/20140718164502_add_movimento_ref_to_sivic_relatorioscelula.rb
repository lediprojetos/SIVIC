class AddMovimentoRefToSivicRelatorioscelula < ActiveRecord::Migration
  def change
    add_reference :sivic_relatorioscelulas, :sivic_movimentofinanceiro, index: true
  end
end
