json.array!(@sivic_situacaoatividades) do |sivic_situacaoatividade|
  json.extract! sivic_situacaoatividade, :nome
  json.url sivic_situacaoatividade_url(sivic_situacaoatividade, format: :json)
end