class AddDataInclusaoToSivicMinisteriodiscipulos < ActiveRecord::Migration
  def change
    add_column :sivic_ministeriodiscipulos, :data_inclusao, :date
  end
end
