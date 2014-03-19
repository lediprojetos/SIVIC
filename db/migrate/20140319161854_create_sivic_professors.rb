class CreateSivicProfessors < ActiveRecord::Migration
  def change
    create_table :sivic_professors do |t|
      t.references :sivic_pessoa, index: true
      t.references :user, index: true
      t.references :user, index: true
      t.datetime :DATA_bloqueio

      t.timestamps
    end
  end
end
