json.array!(@sivic_tipo_eventos) do |sivic_tipo_evento|
  json.extract! sivic_tipo_evento, :desc_tipoevento, :sivic_igreja_id
  json.url sivic_tipo_evento_url(sivic_tipo_evento, format: :json)
end