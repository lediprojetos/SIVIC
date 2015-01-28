json.array!(@sivic_fechamentos) do |sivic_fechamento|
  json.extract! sivic_fechamento, :sivic_igreja_id, :desc_fechamento, :valr_fechamento, :tipo_fechamento, :data_fechamento, :data_exclusao, :User_id
  json.url sivic_fechamento_url(sivic_fechamento, format: :json)
end