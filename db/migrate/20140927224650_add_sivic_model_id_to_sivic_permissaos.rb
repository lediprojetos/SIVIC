class AddSivicModelIdToSivicPermissaos < ActiveRecord::Migration
  def change
    add_column :sivic_permissaos, :sivic_model_id, :integer
    remove_column :sivic_permissaos, :mome_model
  end
end
