class AddFlagToSivicCelulas < ActiveRecord::Migration
  def change
    add_column :sivic_celulas, :flag_gerarelatorio, :boolean
  end
end
