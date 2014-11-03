class CreateSivicAulas < ActiveRecord::Migration
  def change
    create_table :sivic_aulas do |t|
      t.string :nome_aula
      t.datetime :data_aula
      t.references :sivic_igreja, index: true
      t.references :sivic_turmamoduloprofessor, index: true
      t.integer :user_inclusao, :integer, :references => :User, index: true

      t.timestamps
    end
  end
end
