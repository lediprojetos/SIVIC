class CreateSivicNotaalunos < ActiveRecord::Migration
  def change
    create_table :sivic_notaalunos do |t|
      t.float :nota
      t.references :sivic_licao, index: true
      t.references :sivic_turmaaluno, index: true
      t.integer :user_inclusao, :integer, :references => :User, index: true

      t.timestamps
    end
  end
end
