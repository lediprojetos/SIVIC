json.array!(@sivic_alunoaulas) do |sivic_alunoaula|
  json.extract! sivic_alunoaula, :sivic_turmaaluno_id, :sivic_aula_id, :flag_ausente
  json.url sivic_alunoaula_url(sivic_alunoaula, format: :json)
end