class CreateSivicEstados < ActiveRecord::Migration
  def change
    create_table :sivic_estados do |t|
      t.string :nome_estado
      t.string :sigl_estado

      t.timestamps
    end

	    SivicEstado.create(:nome_estado => "Goias", :sigl_estado => "GO")
	    SivicEstado.create(:nome_estado => "Minas Gerais", :sigl_estado => "MG")
	    SivicEstado.create(:nome_estado => "Tocantins", :sigl_estado => "TO")    
  end

end
