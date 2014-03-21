json.array!(@sivic_professors) do |sivic_professor|
  json.extract! sivic_professor, :sivic_pessoa_id, :user_id, :user_id, :DATA_bloqueio
  json.url sivic_professor_url(sivic_professor, format: :json)
end