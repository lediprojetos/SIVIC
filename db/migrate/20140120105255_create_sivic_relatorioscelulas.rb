class CreateSivicRelatorioscelulas < ActiveRecord::Migration
  def change
    create_table :sivic_relatorioscelulas do |t|
      t.references :sivic_celula, index: true
      t.date :DATA_Reuniao
      t.time :DATA_Horainicio
      t.time :DATA_HoraTermino
      t.integer :NUMR_NumVisitante
      t.integer :NUMR_NumParticipante
      t.string :DESC_AssuntoEstudo
      t.string :DESC_TextoBiblico
      t.decimal :VALR_Oferta
      t.integer :NUMR_Decisoes
      t.text :DESC_OutrasInformacoes
      t.references :sivic_situacoesrelatorio, index: true
      t.integer :NUMR_QtdNovoConvertido
      t.integer :NUMR_QtdResgate
      t.integer :NUMR_QtdPreEncontro
      t.integer :NUMR_QtdEncontro
      t.integer :NUMR_QtdPosEncontro
      t.integer :NUMR_QtdEscoLid1
      t.integer :NUMR_EscoLid2
      t.integer :NUMR_EscoLid3
      t.integer :NUMR_QtdLidCelula

      t.timestamps
    end
  end
end
