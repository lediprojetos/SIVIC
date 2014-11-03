json.array!(@sivic_situacaodiscipulos) do |sivic_situacaodiscipulo|
  json.extract! sivic_situacaodiscipulo, :sivic_igrejas_id, :user_id, :user_id, :nome_situacao, :data_exclusao
  json.url sivic_situacaodiscipulo_url(sivic_situacaodiscipulo, format: :json)
end