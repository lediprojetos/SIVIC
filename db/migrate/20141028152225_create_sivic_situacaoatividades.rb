class CreateSivicSituacaoatividades < ActiveRecord::Migration
  def change
    create_table :sivic_situacaoatividades do |t|
      t.string :nome

      t.timestamps
    end
  end
end
