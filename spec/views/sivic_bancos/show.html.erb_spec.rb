require 'spec_helper'

describe "sivic_bancos/show" do
  before(:each) do
    @sivic_banco = assign(:sivic_banco, stub_model(SivicBanco,
      :nome_banco => "Nome Banco",
      :numr_codigo => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome Banco/)
    rendered.should match(/1/)
  end
end
