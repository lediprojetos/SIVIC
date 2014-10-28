json.array!(@sivic_permissaos) do |sivic_permissao|
  json.extract! sivic_permissao, :mome_model, :mumr_acao, :desc_permissao
  json.url sivic_permissao_url(sivic_permissao, format: :json)
end