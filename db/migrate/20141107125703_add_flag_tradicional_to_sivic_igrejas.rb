class AddFlagTradicionalToSivicIgrejas < ActiveRecord::Migration
  def change
    add_column :sivic_igrejas, :flag_tradicional, :boolean
  end
end
