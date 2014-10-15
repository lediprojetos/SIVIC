class AddCamposToSivicIgreja < ActiveRecord::Migration
  def change
    add_reference :sivic_igrejas, :sivic_plano, index: true
    add_column :sivic_igrejas, :numr_qtdmembros, :integer
    add_column :sivic_igrejas, :numr_qtdusuario, :integer
    add_column :sivic_igrejas, :data_inicioplano, :datetime
    add_column :sivic_igrejas, :data_fimplano, :datetime
  end
end
