class CreateSivicTipoEventos < ActiveRecord::Migration
  def change
    create_table :sivic_tipo_eventos do |t|
      t.string :desc_tipoevento
      t.references :sivic_igreja, index: true

      t.timestamps
      end

      SivicTipoEvento.create(:desc_tipoevento => "Resgate")
      SivicTipoEvento.create(:desc_tipoevento => "Encontro")

  end
end
