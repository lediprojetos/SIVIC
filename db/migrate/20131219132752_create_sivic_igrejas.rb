class CreateSivicIgrejas < ActiveRecord::Migration
  def change
    create_table :sivic_igrejas do |t|
      #t.column :father_id, :integer, :references => :sivic_igrejas 
      t.string :NOME_igreja
      t.string :NUMR_telefone
      t.string :NOME_responsavel
      t.string :NUMR_cnpj
      t.references :sivic_endereco, index: true

      t.timestamps
    end
  end

   def self.down
    drop_table :sivic_igrejas
  end
end
