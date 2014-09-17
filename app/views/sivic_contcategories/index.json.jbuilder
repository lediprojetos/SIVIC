json.array!(@sivic_contcategories) do |sivic_contcategory|
  json.extract! sivic_contcategory, :numr_contador, :sivic_igreja_id
  json.url sivic_contcategory_url(sivic_contcategory, format: :json)
end