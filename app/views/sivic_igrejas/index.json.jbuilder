json.array!(@sivic_igrejas) do |sivic_igreja|
  json.extract! sivic_igreja, :NOME_igreja, :NUMR_telefone, :NOME_responsavel, :NUMR_cnpj, :sivic_endereco_id
  json.url sivic_igreja_url(sivic_igreja, format: :json)
end