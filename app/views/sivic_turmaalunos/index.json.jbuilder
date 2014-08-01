json.array!(@sivic_turmaalunos) do |sivic_turmaaluno|
  json.extract! sivic_turmaaluno, :sivic_turma_id, :sivic_pessoa_id, :user_id, :data_bloqueio
  json.url sivic_turmaaluno_url(sivic_turmaaluno, format: :json)
end