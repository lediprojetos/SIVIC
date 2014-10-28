json.array!(@sivic_escolaridades) do |sivic_escolaridade|
  json.extract! sivic_escolaridade, :NOME_escolaridade
  json.url sivic_escolaridade_url(sivic_escolaridade, format: :json)
end