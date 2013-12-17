require 'spec_helper'

describe "sivic_cidades/show" do
  before(:each) do
    @sivic_cidade = assign(:sivic_cidade, stub_model(SivicCidade,
      :nome_cidade => "Nome Cidade",
      :sivic_estado => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome Cidade/)
    rendered.should match(//)
  end
end
