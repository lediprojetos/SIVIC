class CreateSivicCursos < ActiveRecord::Migration
  def change
    create_table :sivic_cursos do |t|
      t.string :nome_curso
      t.text :desc_curso
      t.references :sivic_igreja, index: true
      t.integer :user_inclusao, :integer, :references => :User, index: true

      t.timestamps
    end
  end
end
