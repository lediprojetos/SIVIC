class CreateSivicProfissaos < ActiveRecord::Migration
  def change
    create_table :sivic_profissaos do |t|
      t.string :profissao

      t.timestamps
    end
  end
end
