class RenameSivicPessoasMyColumnNomePessoaByHand < ActiveRecord::Migration
 def self.up
  rename_column :sivic_pessoas, :NOME_pessoa, :nome_pessoa
 end

  def self.down
    rename_column :sivic_pessoas, :nome_pessoa, :NOME_pessoa
  end
end
