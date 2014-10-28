require 'spec_helper'

describe "sivic_igrejas/index" do
  before(:each) do
    assign(:sivic_igrejas, [
      stub_model(SivicIgreja,
        :NOME_igreja => "Nome Igreja",
        :NUMR_telefone => "Numr Telefone",
        :NOME_responsavel => "Nome Responsavel",
        :NUMR_cnpj => "Numr Cnpj",
        :sivic_endereco => nil
      ),
      stub_model(SivicIgreja,
        :NOME_igreja => "Nome Igreja",
        :NUMR_telefone => "Numr Telefone",
        :NOME_responsavel => "Nome Responsavel",
        :NUMR_cnpj => "Numr Cnpj",
        :sivic_endereco => nil
      )
    ])
  end

  it "renders a list of sivic_igrejas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome Igreja".to_s, :count => 2
    assert_select "tr>td", :text => "Numr Telefone".to_s, :count => 2
    assert_select "tr>td", :text => "Nome Responsavel".to_s, :count => 2
    assert_select "tr>td", :text => "Numr Cnpj".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
