class CreateSivicEscolaridades < ActiveRecord::Migration
  def change
    create_table :sivic_escolaridades do |t|
      t.string :NOME_escolaridade

      t.timestamps
    end

    SivicEscolaridade.create(:NOME_escolaridade => "Fundamental Incompleto")
    SivicEscolaridade.create(:NOME_escolaridade => "Fundamental Completo")
    SivicEscolaridade.create(:NOME_escolaridade => "Medio Incompleto")
    SivicEscolaridade.create(:NOME_escolaridade => "Medio Completo")
    SivicEscolaridade.create(:NOME_escolaridade => "Superior Incompleto")
    SivicEscolaridade.create(:NOME_escolaridade => "Superior Completo")
    SivicEscolaridade.create(:NOME_escolaridade => "Doutorado Completo")

  end
end
