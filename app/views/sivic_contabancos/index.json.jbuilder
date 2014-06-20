json.array!(@sivic_contabancos) do |sivic_contabanco|
  json.extract! sivic_contabanco, :nome_conta, :numr_agencia, :numr_conta, :numr_dvconta, :sivic_banco_id, :sivic_igreja_id, :User, :User_id, :data_exclusao
  json.url sivic_contabanco_url(sivic_contabanco, format: :json)
end