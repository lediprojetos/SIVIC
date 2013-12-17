class CreateSivicEnderecos < ActiveRecord::Migration
  def change
    create_table :sivic_enderecos do |t|
      t.string :DESC_Bairro
      t.string :DESC_Rua
      t.string :DESC_Complemento
      t.string :DESC_Pontoreferencia
      t.integer :NUMR_Cep
      t.references :sivic_cidade, index: true

      t.timestamps
    end
  end
end
