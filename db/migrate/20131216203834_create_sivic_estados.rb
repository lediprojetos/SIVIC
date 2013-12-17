class CreateSivicEstados < ActiveRecord::Migration
  def change
    create_table :sivic_estados do |t|
      t.string :nome_estado
      t.string :sigl_estado

      t.timestamps
    end
  end
end
