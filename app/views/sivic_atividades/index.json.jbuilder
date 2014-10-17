json.array!(@sivic_atividades) do |sivic_atividade|
  json.extract! sivic_atividade, :nome_atividade, :desc_atividade, :data_bloqueio, :data_exclusao, :sivic_periodicidadeconso_id, :sivic_igreja_id, :User_id
  json.url sivic_atividade_url(sivic_atividade, format: :json)
end