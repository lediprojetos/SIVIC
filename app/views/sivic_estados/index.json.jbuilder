json.array!(@sivic_estados) do |sivic_estado|
  json.extract! sivic_estado, :nome_estado, :sigl_estado
  json.url sivic_estado_url(sivic_estado, format: :json)
end