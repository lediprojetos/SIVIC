json.array!(@sivic_enderecos) do |sivic_endereco|
  json.extract! sivic_endereco, :DESC_Bairro, :DESC_Rua, :DESC_Complemento, :DESC_Pontoreferencia, :NUMR_Cep, :sivic_cidade_id
  json.url sivic_endereco_url(sivic_endereco, format: :json)
end