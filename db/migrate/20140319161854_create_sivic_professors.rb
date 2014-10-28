class CreateSivicProfessors < ActiveRecord::Migration
  def change
    create_table :sivic_professors do |t|
      t.integer :user_inclusao, :integer, :references => :User, index: true 	
      t.references :sivic_pessoa, index: true
      t.integer :user_bloqueio, :integer, :references => :User, index: true
      t.datetime :DATA_bloqueio
      t.timestamps
    end
  end
end
