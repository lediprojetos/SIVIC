class AddSituRefToSivicPessoa < ActiveRecord::Migration
  def change
    add_reference :sivic_pessoas, :sivic_situacaodiscipulo, index: true
    add_column  :sivic_pessoas, :user_situacao, :integer, references: :users
    add_column :sivic_pessoas, :data_situacao, :datetime
  end
end
