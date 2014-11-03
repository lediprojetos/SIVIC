class CreateSivicMinisteriodiscipulos < ActiveRecord::Migration
  def change
    create_table :sivic_ministeriodiscipulos do |t|
      t.references :sivic_discipulo, index: true
      t.references :sivic_ministerio, index: true
      t.boolean :flag_ministerioativo
      t.integer :user_inclusao, :integer, :references => :User, index: true
      t.integer :user_exclusao, :integer, :references => :User, index: true

      t.timestamps
    end
  end
end
