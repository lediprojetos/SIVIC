class AddcampToSivicPessoa < ActiveRecord::Migration
  def change
    add_column :sivic_pessoas, :user_exclusao, :integer, references: :users
    add_column :sivic_pessoas, :data_exclusao, :datetime
  end
end
