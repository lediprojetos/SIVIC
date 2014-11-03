require 'spec_helper'

describe "sivic_igrejas/show" do
  before(:each) do
    @sivic_igreja = assign(:sivic_igreja, stub_model(SivicIgreja,
      :NOME_igreja => "Nome Igreja",
      :NUMR_telefone => "Numr Telefone",
      :NOME_responsavel => "Nome Responsavel",
      :NUMR_cnpj => "Numr Cnpj",
      :sivic_endereco => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome Igreja/)
    rendered.should match(/Numr Telefone/)
    rendered.should match(/Nome Responsavel/)
    rendered.should match(/Numr Cnpj/)
    rendered.should match(//)
  end
end
