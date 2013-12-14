class CreateSivicEscolaridades < ActiveRecord::Migration
  def change
    create_table :sivic_escolaridades do |t|
      t.string :escolaridade

      t.timestamps
    end
  end
end
