class CreateSivicTipmovfinanceiros < ActiveRecord::Migration
  def change
    create_table :sivic_tipmovfinanceiros do |t|
      t.string :DESC_movimento

      t.timestamps
    end
    
     SivicTipmovfinanceiro.create(:DESC_movimento => "Debito")
     SivicTipmovfinanceiro.create(:DESC_movimento => "Credito")

  end
end
