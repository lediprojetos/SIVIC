class CreateSivicModuloturmas < ActiveRecord::Migration
  def change
    create_table :sivic_moduloturmas do |t|
      t.references :sivic_moduloescola, index: true
      t.references :sivic_turma, index: true

      t.timestamps
    end
  end
end
