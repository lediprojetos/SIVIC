require 'spec_helper'

describe "sivic_inscricaos/edit" do
  before(:each) do
    @sivic_inscricao = assign(:sivic_inscricao, stub_model(SivicInscricao,
      :nome_igreja => "MyString",
      :nome_pessoa => "MyString",
      :desc_telefone => "MyString",
      :numg_cidade => 1,
      :desc_email => "MyString",
      :desc_senha => "MyString",
      :desc_confirmasenha => "MyString"
    ))
  end

  it "renders the edit sivic_inscricao form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_inscricao_path(@sivic_inscricao), "post" do
      assert_select "input#sivic_inscricao_nome_igreja[name=?]", "sivic_inscricao[nome_igreja]"
      assert_select "input#sivic_inscricao_nome_pessoa[name=?]", "sivic_inscricao[nome_pessoa]"
      assert_select "input#sivic_inscricao_desc_telefone[name=?]", "sivic_inscricao[desc_telefone]"
      assert_select "input#sivic_inscricao_numg_cidade[name=?]", "sivic_inscricao[numg_cidade]"
      assert_select "input#sivic_inscricao_desc_email[name=?]", "sivic_inscricao[desc_email]"
      assert_select "input#sivic_inscricao_desc_senha[name=?]", "sivic_inscricao[desc_senha]"
      assert_select "input#sivic_inscricao_desc_confirmasenha[name=?]", "sivic_inscricao[desc_confirmasenha]"
    end
  end
end
