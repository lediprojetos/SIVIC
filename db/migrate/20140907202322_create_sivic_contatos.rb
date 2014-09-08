class CreateSivicContatos < ActiveRecord::Migration
  def change
    create_table :sivic_contatos do |t|
      t.string :desc_nome
      t.string :desc_email
      t.string :desc_assunto
      t.string :desc_mensagem
      t.string :desc_ip

      t.timestamps
    end
  end
end
