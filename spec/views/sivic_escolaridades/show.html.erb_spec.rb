require 'spec_helper'

describe "sivic_escolaridades/show" do
  before(:each) do
    @sivic_escolaridade = assign(:sivic_escolaridade, stub_model(SivicEscolaridade,
      :NOME_escolaridade => "Nome Escolaridade"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome Escolaridade/)
  end
end
