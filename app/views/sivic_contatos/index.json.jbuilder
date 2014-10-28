json.array!(@sivic_contatos) do |sivic_contato|
  json.extract! sivic_contato, :desc_nome, :desc_email, :desc_assunto, :desc_mensagem, :desc_ip
  json.url sivic_contato_url(sivic_contato, format: :json)
end