class CreateSivicEventos < ActiveRecord::Migration
  def change
    create_table :sivic_eventos do |t|
      t.string :DESC_evento
      t.text :DESC_resumo
      t.decimal :VARL_inscricao, :precision => 10, :scale => 2
      t.datetime :DATA_inicio
      t.datetime :DATA_fim
      t.integer :FLAG_ilimitado
      t.integer :NUMR_qdtVagas
      t.references :sivic_user, index: true
      t.references :sivic_igreja, index: true
      t.references :sivic_endereco, index: true
      t.references :sivic_tipo_evento, index: true

      t.timestamps
    end
  end
end
