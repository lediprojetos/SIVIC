json.array!(@sivic_estados) do |sivic_estado|
  json.extract! sivic_estado, :nome, :sigla
  json.url sivic_estado_url(sivic_estado, format: :json)
end