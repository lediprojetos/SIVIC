class CreateSivicEventos < ActiveRecord::Migration
  def change
    create_table :sivic_eventos do |t|
      t.string :DESC_evento
      t.text :DESC_resumo
      t.decimal :VARL_inscricao, :precision => 10, :scale => 2
      t.date :DATA_inicio
      t.date :DATA_fim
      t.boolean :FLAG_ilimitado
      t.boolean :NUMR_qdtVagas
      t.references :User, index: true
      t.references :sivic_igreja, index: true
      t.references :sivic_endereco, index: true
      t.references :sivic_tipo_evento, index: true

      t.timestamps
    end
  end
end
