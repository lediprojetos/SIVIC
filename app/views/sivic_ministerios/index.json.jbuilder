json.array!(@sivic_ministerios) do |sivic_ministerio|
  json.extract! sivic_ministerio, :nome_ministerio, :sigl_ministerio, :sivic_igreja_id
  json.url sivic_ministerio_url(sivic_ministerio, format: :json)
end