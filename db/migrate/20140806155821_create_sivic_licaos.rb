class CreateSivicLicaos < ActiveRecord::Migration
  def change
    create_table :sivic_licaos do |t|
      t.string :nome_licao
      t.references :sivic_igreja, index: true
      t.references :sivic_turmamoduloprofessor, index: true
      t.integer :user_inclusao, :integer, :references => :User, index: true

      t.timestamps
    end
  end
end
