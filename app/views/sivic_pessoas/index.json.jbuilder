json.array!(@sivic_pessoas) do |sivic_pessoa|
  json.extract! sivic_pessoa, :NOME_pessoa, :DESC_email, :DESC_observacao, :sivic_igreja_id, :User_id
  json.url sivic_pessoa_url(sivic_pessoa, format: :json)
end