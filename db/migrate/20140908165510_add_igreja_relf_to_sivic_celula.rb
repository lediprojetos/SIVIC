class AddIgrejaRelfToSivicCelula < ActiveRecord::Migration
  def change
    add_reference :sivic_celulas, :sivic_igreja, index: true
  end
end
