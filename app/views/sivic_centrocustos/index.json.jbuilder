json.array!(@sivic_centrocustos) do |sivic_centrocusto|
  json.extract! sivic_centrocusto, :nome_centrocusto, :desc_centrocusto, :user_id, :sivic_igreja_id
  json.url sivic_centrocusto_url(sivic_centrocusto, format: :json)
end