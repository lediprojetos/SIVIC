json.array!(@sivic_inscricaos) do |sivic_inscricao|
  json.extract! sivic_inscricao, :nome_igreja, :nome_pessoa, :desc_telefone, :numg_cidade, :desc_email, :desc_senha, :desc_confirmasenha
  json.url sivic_inscricao_url(sivic_inscricao, format: :json)
end