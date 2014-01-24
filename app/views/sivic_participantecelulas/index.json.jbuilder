json.array!(@sivic_participantecelulas) do |sivic_participantecelula|
  json.extract! sivic_participantecelula, :NOME_Participante, :DESC_Email, :NUMR_Telefone, :DESC_SituacaoParticipante
  json.url sivic_participantecelula_url(sivic_participantecelula, format: :json)
end