json.array!(@observacoesrelatorios) do |observacoesrelatorio|
  json.extract! observacoesrelatorio, :sivic_relatorioscelulas_id, :sivic_pessoas_id, :DESC_Observacao
  json.url observacoesrelatorio_url(observacoesrelatorio, format: :json)
end