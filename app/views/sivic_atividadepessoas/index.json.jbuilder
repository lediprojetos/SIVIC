json.array!(@sivic_atividadepessoas) do |sivic_atividadepessoa|
  json.extract! sivic_atividadepessoa, :flag_ativo, :data_exclusao, :data_bloqueio, :sivic_atividade_id, :sivic_igreja_id, :sivic_pessoa_id, :User_id
  json.url sivic_atividadepessoa_url(sivic_atividadepessoa, format: :json)
end