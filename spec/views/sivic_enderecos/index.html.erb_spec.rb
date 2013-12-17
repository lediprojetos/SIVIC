require 'spec_helper'

describe "sivic_enderecos/index" do
  before(:each) do
    assign(:sivic_enderecos, [
      stub_model(SivicEndereco,
        :DESC_Bairro => "Desc Bairro",
        :DESC_Rua => "Desc Rua",
        :DESC_Complemento => "Desc Complemento",
        :DESC_Pontoreferencia => "Desc Pontoreferencia",
        :NUMR_Cep => 1,
        :sivic_cidade => nil
      ),
      stub_model(SivicEndereco,
        :DESC_Bairro => "Desc Bairro",
        :DESC_Rua => "Desc Rua",
        :DESC_Complemento => "Desc Complemento",
        :DESC_Pontoreferencia => "Desc Pontoreferencia",
        :NUMR_Cep => 1,
        :sivic_cidade => nil
      )
    ])
  end

  it "renders a list of sivic_enderecos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Desc Bairro".to_s, :count => 2
    assert_select "tr>td", :text => "Desc Rua".to_s, :count => 2
    assert_select "tr>td", :text => "Desc Complemento".to_s, :count => 2
    assert_select "tr>td", :text => "Desc Pontoreferencia".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
