json.array!(@sivic_notaalunos) do |sivic_notaaluno|
  json.extract! sivic_notaaluno, :nota, :sivic_licao_id, :sivic_turmaaluno_id, :user_id
  json.url sivic_notaaluno_url(sivic_notaaluno, format: :json)
end