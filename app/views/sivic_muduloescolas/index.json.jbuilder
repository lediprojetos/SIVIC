json.array!(@sivic_muduloescolas) do |sivic_muduloescola|
  json.extract! sivic_muduloescola, :sivic_igreja_id, :user_id, :nome_modulo
  json.url sivic_muduloescola_url(sivic_muduloescola, format: :json)
end