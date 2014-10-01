class AddSivicModuloIdToSivicModels < ActiveRecord::Migration
  def change
    add_column :sivic_models, :sivic_modulo_id, :integer
  end
end
