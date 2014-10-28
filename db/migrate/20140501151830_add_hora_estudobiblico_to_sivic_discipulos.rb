class AddHoraEstudobiblicoToSivicDiscipulos < ActiveRecord::Migration
  def change
    add_column :sivic_discipulos, :hora_estudobiblico, :time
  end
end
