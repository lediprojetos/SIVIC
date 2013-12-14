json.array!(@sivic_igrejas) do |sivic_igreja|
  json.extract! sivic_igreja, :nome, :igrejaSede_id, :endereco_id
  json.url sivic_igreja_url(sivic_igreja, format: :json)
end