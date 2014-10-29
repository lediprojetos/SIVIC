class CreateSivicAtividadepessoas < ActiveRecord::Migration
  def change
    create_table :sivic_atividadepessoas do |t|
      t.boolean :flag_ativo
      t.datetime :data_exclusao
      t.datetime :data_bloqueio
      t.references :sivic_atividade, index: true
      t.references :sivic_igreja, index: true
      t.integer :sivic_pessoaatividade, :integer, :references => :SivicPessoa, index: true 
      t.integer :sivic_pessoaresponsavel, :integer, :references => :SivicPessoa, index: true 
      t.integer :user_inclusao, :integer, :references => :User, index: true
      t.integer :user_bloqueio, :integer, :references => :User, index: true
      t.integer :user_exclusao, :integer, :references => :User, index: true

      t.timestamps
    end
  end
end
