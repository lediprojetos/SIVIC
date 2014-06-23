class CreateSivicFornecedors < ActiveRecord::Migration
  def change
    create_table :sivic_fornecedors do |t|
      t.string :nome_fornecedor
      t.string :numr_cnpj
      t.string :numr_cpf
      t.string :numr_telefone
      t.string :nome_responsavel
      t.string :desc_fornecedor
      t.references :sivic_endereco, index: true
      t.references :sivic_igreja, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
