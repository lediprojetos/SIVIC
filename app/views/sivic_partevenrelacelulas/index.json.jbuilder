json.array!(@sivic_partevenrelacelulas) do |sivic_partevenrelacelula|
  json.extract! sivic_partevenrelacelula, :sivic_relatorioscelula, :_id, :sivic_participantecelula_id, :DESC_SituacaoParticipante
  json.url sivic_partevenrelacelula_url(sivic_partevenrelacelula, format: :json)
end