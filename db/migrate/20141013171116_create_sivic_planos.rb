class CreateSivicPlanos < ActiveRecord::Migration
  def change
    create_table :sivic_planos do |t|
      t.string :nome_plano
      t.integer :numr_qtdmembro
      t.integer :numr_qtdusuario

      t.timestamps
    end
  end
end
