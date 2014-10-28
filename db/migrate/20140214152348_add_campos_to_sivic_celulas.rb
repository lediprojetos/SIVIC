class AddCamposToSivicCelulas < ActiveRecord::Migration
  def change
    add_column :sivic_celulas, :DESC_sexo, :string
    add_column :sivic_celulas, :FLAG_crianca, :boolean
    add_column :sivic_celulas, :FLAG_jovem, :boolean
    add_column :sivic_celulas, :FLAG_adulto, :boolean
  end
end
