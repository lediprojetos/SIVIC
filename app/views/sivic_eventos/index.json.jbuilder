json.array!(@sivic_eventos) do |sivic_evento|
  json.extract! sivic_evento, :DESC_evento, :DESC_resumo, :VARL_inscricao, :DATA_inicio, :DATA_fim, :FLAG_ilimitado, :NUMR_qdtVagas, :sivic_user_id, :sivic_igreja_id, :sivic_endereco_id, :sivic_tipoEvento_id
  json.url sivic_evento_url(sivic_evento, format: :json)
end