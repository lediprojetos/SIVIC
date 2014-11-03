class CreateSivicPermissaos < ActiveRecord::Migration
  def change
    create_table :sivic_permissaos do |t|
      t.string :mome_model
      t.integer :mumr_acao
      t.text :desc_permissao

      t.timestamps
    end
  end
end
