class CreateSivicUserpermissaos < ActiveRecord::Migration
  def change
    create_table :sivic_userpermissaos do |t|
      t.references :sivic_permissao, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
