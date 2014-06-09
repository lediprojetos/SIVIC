class AddDescConvidadoporToSivicParteventos < ActiveRecord::Migration
  def change
    add_column :sivic_parteventos, :desc_convidadopor, :string
  end
end
