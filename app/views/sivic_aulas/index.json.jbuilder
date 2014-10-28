json.array!(@sivic_aulas) do |sivic_aula|
  json.extract! sivic_aula, :nome_aula, :data_aula, :user_id, :sivic_igreja_id, :sivic_tumamoduloprofessor_id
  json.url sivic_aula_url(sivic_aula, format: :json)
end