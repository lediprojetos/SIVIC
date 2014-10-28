json.array!(@sivic_ministeriodiscipulos) do |sivic_ministeriodiscipulo|
  json.extract! sivic_ministeriodiscipulo, :sivic_discipulo_id, :sivic_ministerio_id, :flag_ministerioativo
  json.url sivic_ministeriodiscipulo_url(sivic_ministeriodiscipulo, format: :json)
end