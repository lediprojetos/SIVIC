json.array!(@sivic_movimentofinanceiros) do |sivic_movimentofinanceiro|
  json.extract! sivic_movimentofinanceiro, :VALR_movimento, :User_id, :DATA_exclusao, :FLAG_baixa, :User_id, :sivic_tipmovfinanceiro_id, :sivic_evento_id
  json.url sivic_movimentofinanceiro_url(sivic_movimentofinanceiro, format: :json)
end