json.array!(@sivic_categoria) do |sivic_categorium|
  json.extract! sivic_categorium, :nome_categoria, :tipo_categoria, :user_id, :sivic_igreja_id
  json.url sivic_categorium_url(sivic_categorium, format: :json)
end