class CreateSivicBancos < ActiveRecord::Migration
  def change
    create_table :sivic_bancos do |t|
      t.string :nome_banco
      t.integer :numr_codigo

      t.timestamps
    end
  end
end
