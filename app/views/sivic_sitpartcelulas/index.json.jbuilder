json.array!(@sivic_sitpartcelulas) do |sivic_sitpartcelula|
  json.extract! sivic_sitpartcelula, :DESC_situacao, :sivic_igreja_id
  json.url sivic_sitpartcelula_url(sivic_sitpartcelula, format: :json)
end