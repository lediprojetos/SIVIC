json.array!(@sivic_profissaos) do |sivic_profissao|
  json.extract! sivic_profissao, :profissao
  json.url sivic_profissao_url(sivic_profissao, format: :json)
end