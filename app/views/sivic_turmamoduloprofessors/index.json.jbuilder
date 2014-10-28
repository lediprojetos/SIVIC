json.array!(@sivic_turmamoduloprofessors) do |sivic_turmamoduloprofessor|
  json.extract! sivic_turmamoduloprofessor, :sivic_professors_id, :sivic_moduloescolas_id, :sivic_turmas_id
  json.url sivic_turmamoduloprofessor_url(sivic_turmamoduloprofessor, format: :json)
end