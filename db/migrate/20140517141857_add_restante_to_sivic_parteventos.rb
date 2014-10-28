class AddRestanteToSivicParteventos < ActiveRecord::Migration
  def change
    add_column :sivic_parteventos, :flag_passando, :boolean
  end
end
