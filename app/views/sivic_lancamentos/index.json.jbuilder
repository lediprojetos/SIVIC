json.array!(@sivic_lancamentos) do |sivic_lancamento|
  json.extract! sivic_lancamento, :nome_lancamento, :valr_lancamento, :data_vencimento, :data_competencia, :flag_pago, :flag_dizimo, :numr_recorrencia, :sivic_category_id, :sivic_centrocusto_id, :sivic_rede_id, :sivic_tipmovfinanceiro_id, :sivic_pessoa_id, :sivic_fornecedor_id, :sivic_igreja_id, :user_id, :user_id, :data_exclusao
  json.url sivic_lancamento_url(sivic_lancamento, format: :json)
end