require 'spec_helper'

describe "sivic_inscricaos/index" do
  before(:each) do
    assign(:sivic_inscricaos, [
      stub_model(SivicInscricao,
        :nome_igreja => "Nome Igreja",
        :nome_pessoa => "Nome Pessoa",
        :desc_telefone => "Desc Telefone",
        :numg_cidade => 1,
        :desc_email => "Desc Email",
        :desc_senha => "Desc Senha",
        :desc_confirmasenha => "Desc Confirmasenha"
      ),
      stub_model(SivicInscricao,
        :nome_igreja => "Nome Igreja",
        :nome_pessoa => "Nome Pessoa",
        :desc_telefone => "Desc Telefone",
        :numg_cidade => 1,
        :desc_email => "Desc Email",
        :desc_senha => "Desc Senha",
        :desc_confirmasenha => "Desc Confirmasenha"
      )
    ])
  end

  it "renders a list of sivic_inscricaos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome Igreja".to_s, :count => 2
    assert_select "tr>td", :text => "Nome Pessoa".to_s, :count => 2
    assert_select "tr>td", :text => "Desc Telefone".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Desc Email".to_s, :count => 2
    assert_select "tr>td", :text => "Desc Senha".to_s, :count => 2
    assert_select "tr>td", :text => "Desc Confirmasenha".to_s, :count => 2
  end
end
