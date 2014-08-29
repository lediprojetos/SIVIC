class AddCamposToSivicDiscipulo < ActiveRecord::Migration
  def change
    add_column :sivic_discipulos, :user_exclusao, :integer, references: :users
    add_reference :sivic_discipulos, :sivic_situacaodiscipulo, index: true
    add_column :sivic_discipulos, :data_exclusao, :datetime
	


  end
end
