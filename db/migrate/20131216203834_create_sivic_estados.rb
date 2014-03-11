#encoding: utf-8
class CreateSivicEstados < ActiveRecord::Migration
  def change
    create_table :sivic_estados do |t|
      t.string :nome_estado
      t.string :sigl_estado

      t.timestamps
    end

    SivicEstado.create(:nome_estado => 'Acre', :sigl_estado =>  'AC')
    SivicEstado.create(:nome_estado => 'Alagoas', :sigl_estado => 'AL')
    SivicEstado.create(:nome_estado => 'Amazonas', :sigl_estado => 'AM')
    SivicEstado.create(:nome_estado => 'Amapá', :sigl_estado => 'AP')
    SivicEstado.create(:nome_estado => 'Bahia', :sigl_estado => 'BA')
    SivicEstado.create(:nome_estado => 'Ceará', :sigl_estado => 'CE')
    SivicEstado.create(:nome_estado => 'Distrito Federal', :sigl_estado => 'DF')
    SivicEstado.create(:nome_estado => 'Espírito Santo', :sigl_estado => 'ES')
    SivicEstado.create(:nome_estado => 'Goiás',:sigl_estado => 'GO')
    SivicEstado.create(:nome_estado =>  'Maranhão', :sigl_estado => 'MA')
    SivicEstado.create(:nome_estado =>  'Minas Gerais', :sigl_estado => 'MG')
    SivicEstado.create(:nome_estado =>  'Mato Grosso do Sul', :sigl_estado => 'MS')
    SivicEstado.create(:nome_estado =>  'Mato Grosso', :sigl_estado => 'MT')
    SivicEstado.create(:nome_estado =>  'Pará', :sigl_estado => 'PA')
    SivicEstado.create(:nome_estado =>  'Paraíba', :sigl_estado => 'PB')
    SivicEstado.create(:nome_estado =>  'Pernambuco', :sigl_estado => 'PE')
    SivicEstado.create(:nome_estado =>  'Piauí', :sigl_estado => 'PI')
    SivicEstado.create(:nome_estado =>  'Paraná', :sigl_estado => 'PR')
    SivicEstado.create(:nome_estado =>  'Rio de Janeiro', :sigl_estado => 'RJ')
    SivicEstado.create(:nome_estado =>  'Rio Grande do Norte', :sigl_estado => 'RN')
    SivicEstado.create(:nome_estado =>  'Rondônia', :sigl_estado => 'RO')
    SivicEstado.create(:nome_estado =>  'Roraima', :sigl_estado => 'RR')
    SivicEstado.create(:nome_estado =>  'Rio Grande do Sul', :sigl_estado => 'RS')
    SivicEstado.create(:nome_estado =>  'Santa Catarina', :sigl_estado => 'SC')
    SivicEstado.create(:nome_estado =>  'Sergipe', :sigl_estado => 'SE')
    SivicEstado.create(:nome_estado =>  'São Paulo', :sigl_estado => 'SP')
    SivicEstado.create(:nome_estado =>  'Tocantins', :sigl_estado => 'TO')
  end

end
