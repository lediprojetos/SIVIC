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
    SivicPessoa.create(:NOME_pessoa => "Diel Oliveira de Faria", :DESC_email => "diel.faria@gmail.com", :DESC_observacao => "Usuario Padrao", :User_id => 1, :sivic_igreja_id => 1)
    SivicPessoa.create(:NOME_pessoa => "Leandro Pereira Gomes", :DESC_email => "lpgomes@gmail.com", :DESC_observacao => "Usuario Padrao", :User_id => 2, :sivic_igreja_id => 1)  
  end

   def self.down
    drop_table :sivic_pessoas
  end
end
