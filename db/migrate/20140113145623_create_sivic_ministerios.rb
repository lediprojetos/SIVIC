class CreateSivicMinisterios < ActiveRecord::Migration
  def change
    create_table :sivic_ministerios do |t|
      t.string :nome_ministerio
      t.string :sigl_ministerio
      t.references :sivic_igreja, index: true

      t.timestamps
    end
  end
end
