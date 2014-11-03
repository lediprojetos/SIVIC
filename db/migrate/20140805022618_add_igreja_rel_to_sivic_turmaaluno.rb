class AddIgrejaRelToSivicTurmaaluno < ActiveRecord::Migration
  def change
    add_reference :sivic_turmaalunos, :sivic_igreja, index: true
  end
end
