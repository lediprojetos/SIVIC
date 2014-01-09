class CreateSivicCidades < ActiveRecord::Migration
  def change
    create_table :sivic_cidades do |t|
      t.string :nome_cidade
      t.references :sivic_estado, index: true

      t.timestamps
    end

	    SivicCidade.create(:nome_cidade => "Goiania", :sivic_estado_id => "1")
	    SivicCidade.create(:nome_cidade => "Aparecida de Goiania", :sivic_estado_id => "1")

	    SivicCidade.create(:nome_cidade => "Tiros", :sivic_estado_id => "2")
	    SivicCidade.create(:nome_cidade => "Presidente Prudente", :sivic_estado_id => "2")

	    SivicCidade.create(:nome_cidade => "Palmas", :sivic_estado_id => "3")
	    SivicCidade.create(:nome_cidade => "Hidrolina", :sivic_estado_id => "3")    

  end

end
