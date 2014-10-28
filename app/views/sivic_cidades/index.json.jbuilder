json.array!(@sivic_cidades) do |sivic_cidade|
  json.extract! sivic_cidade, :nome_cidade, :sivic_estado_id
  json.url sivic_cidade_url(sivic_cidade, format: :json)
end