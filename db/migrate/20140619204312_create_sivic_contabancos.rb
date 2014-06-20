class CreateSivicContabancos < ActiveRecord::Migration
  def change
    create_table :sivic_contabancos do |t|
      t.string :nome_conta
      t.string :numr_agencia
      t.string :numr_conta
      t.string :numr_dvconta
      t.references :sivic_banco, index: true
      t.references :sivic_igreja, index: true
      t.integer :user_inclusao, :integer, :references => :User, index: true
      t.integer :user_exclusao, :integer, :references => :User, index: true
      t.date :data_exclusao

      t.timestamps
    end
  end
end
