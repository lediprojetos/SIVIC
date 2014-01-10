class CreateSivicPessoas < ActiveRecord::Migration
  def change
    create_table :sivic_pessoas do |t|
      t.integer :father_id, :integer, :references => :sivic_pessoas 
      t.string :NOME_pessoa
      t.string :DESC_email
      t.string :DESC_observacao
      t.references :sivic_igreja, index: true
      t.references :User, index: true

      t.timestamps
    end
  end

   def self.down
    drop_table :sivic_pessoas
  end
end
