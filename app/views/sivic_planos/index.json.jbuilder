json.array!(@sivic_planos) do |sivic_plano|
  json.extract! sivic_plano, :nome_plano, :numr_qtdmembro, :numr_qtdusuario
  json.url sivic_plano_url(sivic_plano, format: :json)
end