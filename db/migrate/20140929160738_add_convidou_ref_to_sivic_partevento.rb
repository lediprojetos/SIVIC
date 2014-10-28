class AddConvidouRefToSivicPartevento < ActiveRecord::Migration
  def change
    	add_column :sivic_parteventos, :pessoa_convidou, :integer, references: :sivic_pessoas
  end
end
