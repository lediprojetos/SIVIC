require 'spec_helper'

describe "sivic_contabancos/index" do
  before(:each) do
    assign(:sivic_contabancos, [
      stub_model(SivicContabanco,
        :nome_conta => "Nome Conta",
        :numr_agencia => "Numr Agencia",
        :numr_conta => "Numr Conta",
        :numr_dvconta => "Numr Dvconta",
        :sivic_banco => nil,
        :sivic_igreja => nil,
        :User => "",
        :User => nil
      ),
      stub_model(SivicContabanco,
        :nome_conta => "Nome Conta",
        :numr_agencia => "Numr Agencia",
        :numr_conta => "Numr Conta",
        :numr_dvconta => "Numr Dvconta",
        :sivic_banco => nil,
        :sivic_igreja => nil,
        :User => "",
        :User => nil
      )
    ])
  end

  it "renders a list of sivic_contabancos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome Conta".to_s, :count => 2
    assert_select "tr>td", :text => "Numr Agencia".to_s, :count => 2
    assert_select "tr>td", :text => "Numr Conta".to_s, :count => 2
    assert_select "tr>td", :text => "Numr Dvconta".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
