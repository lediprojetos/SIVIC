require 'spec_helper'

describe "sivic_planos/show" do
  before(:each) do
    @sivic_plano = assign(:sivic_plano, stub_model(SivicPlano,
      :nome_plano => "Nome Plano",
      :numr_qtdmembro => 1,
      :numr_qtdusuario => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome Plano/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
