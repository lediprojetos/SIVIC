class AddIgrejaRefToSivicPartevento < ActiveRecord::Migration
  def change
    add_reference :sivic_parteventos, :sivic_igreja, index: true
  end
end
