json.array!(@sivic_moduloturmas) do |sivic_moduloturma|
  json.extract! sivic_moduloturma, :sivic_moduloescola_id, :sivic_turma_id
  json.url sivic_moduloturma_url(sivic_moduloturma, format: :json)
end