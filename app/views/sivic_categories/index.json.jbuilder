json.array!(@sivic_categories) do |sivic_category|
  json.extract! sivic_category, :nome_categoria, :tipo_categoria, :sivic_igreja_id, :user_id
  json.url sivic_category_url(sivic_category, format: :json)
end