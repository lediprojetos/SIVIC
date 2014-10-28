json.array!(@sivic_contdiscipulos) do |sivic_contdiscipulo|
  json.extract! sivic_contdiscipulo, :NUMR_Contador, :sivic_igreja_id
  json.url sivic_contdiscipulo_url(sivic_contdiscipulo, format: :json)
end