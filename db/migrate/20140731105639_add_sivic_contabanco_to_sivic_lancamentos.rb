class AddSivicContabancoToSivicLancamentos < ActiveRecord::Migration
  def change
    add_column :sivic_lancamentos, :sivic_contabanco_id, :integer
  end
end
