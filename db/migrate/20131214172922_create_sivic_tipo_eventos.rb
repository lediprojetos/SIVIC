class CreateSivicTipoEventos < ActiveRecord::Migration
  def change
    create_table :sivic_tipo_eventos do |t|
      t.string :nome
      t.integer :igreja_id

      t.timestamps
    end
  end
end
