json.array!(@sivic_fornecedors) do |sivic_fornecedor|
  json.extract! sivic_fornecedor, :nome_fornecedor, :numr_cnpj, :numr_cpf, :numr_telefone, :nome_responsavel, :desc_fornecedor, :sivic_endereco_id, :sivic_igreja_id, :user_id
  json.url sivic_fornecedor_url(sivic_fornecedor, format: :json)
end