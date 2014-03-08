json.array!(@sivic_contcelulas) do |sivic_contcelula|
  json.extract! sivic_contcelula, :NUMR_Contador, :sivic_igreja_id
  json.url sivic_contcelula_url(sivic_contcelula, format: :json)
end