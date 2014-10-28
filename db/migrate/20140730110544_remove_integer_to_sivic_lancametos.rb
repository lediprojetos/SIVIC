class RemoveIntegerToSivicLancametos < ActiveRecord::Migration
  def change
    remove_column :sivic_lancamentos, :integer
  end
end
