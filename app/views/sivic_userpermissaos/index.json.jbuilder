json.array!(@sivic_userpermissaos) do |sivic_userpermissao|
  json.extract! sivic_userpermissao, :sivic_permissao_id, :user_id
  json.url sivic_userpermissao_url(sivic_userpermissao, format: :json)
end