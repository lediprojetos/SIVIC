json.array!(@sivic_redes) do |sivic_rede|
  json.extract! sivic_rede, :nome_rede, :sivic_igreja_id
  json.url sivic_rede_url(sivic_rede, format: :json)
end