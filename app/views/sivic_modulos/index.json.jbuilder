json.array!(@sivic_modulos) do |sivic_modulo|
  json.extract! sivic_modulo, :nome_modulo, :desc_modulo, :data_bloqueio
  json.url sivic_modulo_url(sivic_modulo, format: :json)
end