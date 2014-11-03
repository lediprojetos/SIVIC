class CreateSivicInscricaos < ActiveRecord::Migration
  def change
    create_table :sivic_inscricaos do |t|
      t.string :nome_igreja
      t.string :nome_pessoa
      t.string :desc_telefone
      t.integer :numg_cidade
      t.string :desc_email
      t.string :desc_senha
      t.string :desc_confirmasenha

      t.timestamps
    end
  end
end
