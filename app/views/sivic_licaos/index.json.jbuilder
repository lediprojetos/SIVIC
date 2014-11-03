json.array!(@sivic_licaos) do |sivic_licao|
  json.extract! sivic_licao, :nome_licao, :user_id, :sivic_igreja_id, :sivic_turmamoduloprofessor_id
  json.url sivic_licao_url(sivic_licao, format: :json)
end