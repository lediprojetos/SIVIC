json.array!(@sivic_models) do |sivic_model|
  json.extract! sivic_model, :nome_model, :desc_model, :data_bloqueio
  json.url sivic_model_url(sivic_model, format: :json)
end