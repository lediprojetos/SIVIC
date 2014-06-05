json.array!(@sivic_bancos) do |sivic_banco|
  json.extract! sivic_banco, :nome_banco, :numr_codigo
  json.url sivic_banco_url(sivic_banco, format: :json)
end