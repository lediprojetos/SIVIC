json.array!(@sivic_parteventos) do |sivic_partevento|
  json.extract! sivic_partevento, :sivic_pessoa_id, :sivic_evento_id, :sivic_movimentofinanceiro_id, :FLAG_naoparticipou
  json.url sivic_partevento_url(sivic_partevento, format: :json)
end