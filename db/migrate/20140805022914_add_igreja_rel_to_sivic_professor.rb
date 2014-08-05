class AddIgrejaRelToSivicProfessor < ActiveRecord::Migration
  def change
    add_reference :sivic_professors, :sivic_igreja, index: true
  end
end
