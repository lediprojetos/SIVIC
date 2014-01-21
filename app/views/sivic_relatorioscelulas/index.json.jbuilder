json.array!(@sivic_relatorioscelulas) do |sivic_relatorioscelula|
  json.extract! sivic_relatorioscelula, :sivic_celula_id, :DATA_Reuniao, :DATA_Horainicio, :DATA_HoraTermino, :NUMR_NumVisitante, :NUMR_NumParticipante, :DESC_AssuntoEstudo, :DESC_TextoBiblico, :VALR_Oferta, :NUMR_Decisoes, :DESC_OutrasInformacoes, :FLAG_Situacao, :NUMR_QtdNovoConvertido, :NUMR_QtdResgate, :NUMR_QtdPreEncontro, :NUMR_QtdEncontro, :NUMR_QtdPosEncontro, :NUMR_QtdEscoLid1, :NUMR_EscoLid2, :NUMR_EscoLid3, :NUMR_QtdLidCelula
  json.url sivic_relatorioscelula_url(sivic_relatorioscelula, format: :json)
end