json.array!(@sivic_celulas) do |sivic_celula|
  json.extract! sivic_celula, :sivic_pessoa_id, :sivic_endereco_id, :NUMR_Dia, :DATA_Bloqueio
  json.url sivic_celula_url(sivic_celula, format: :json)
end