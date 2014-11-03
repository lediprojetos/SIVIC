json.array!(@sivic_moduloescolas) do |sivic_moduloescola|
  json.extract! sivic_moduloescola, :sivic_igreja_id, :user_id, :nome_modulo
  json.url sivic_moduloescola_url(sivic_moduloescola, format: :json)
end