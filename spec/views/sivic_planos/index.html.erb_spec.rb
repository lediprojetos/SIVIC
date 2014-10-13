require 'spec_helper'

describe "sivic_planos/index" do
  before(:each) do
    assign(:sivic_planos, [
      stub_model(SivicPlano,
        :nome_plano => "Nome Plano",
        :numr_qtdmembro => 1,
        :numr_qtdusuario => 2
      ),
      stub_model(SivicPlano,
        :nome_plano => "Nome Plano",
        :numr_qtdmembro => 1,
        :numr_qtdusuario => 2
      )
    ])
  end

  it "renders a list of sivic_planos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome Plano".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
