json.array!(@sivic_turmas) do |sivic_turma|
  json.extract! sivic_turma, :sivic_igreja_id, :user_id, :user_id, :DESC_turma, :DATA_Inicio, :DATA_Fim, :NUMR_QdtVagas, :DATA_bloqueio
  json.url sivic_turma_url(sivic_turma, format: :json)
end