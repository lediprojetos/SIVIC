json.array!(@sivic_periodicidadecons) do |sivic_periodicidadecon|
  json.extract! sivic_periodicidadecon, :desc_periodicidade, :numr_qtddia, :sivic_igreja_id
  json.url sivic_periodicidadecon_url(sivic_periodicidadecon, format: :json)
end