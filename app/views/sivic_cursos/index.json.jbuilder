json.array!(@sivic_cursos) do |sivic_curso|
  json.extract! sivic_curso, :nome_curso, :desc_curso, :sivic_igreja_id, :user_id
  json.url sivic_curso_url(sivic_curso, format: :json)
end