require 'spec_helper'

describe "sivic_enderecos/edit" do
  before(:each) do
    @sivic_endereco = assign(:sivic_endereco, stub_model(SivicEndereco,
      :DESC_Bairro => "MyString",
      :DESC_Rua => "MyString",
      :DESC_Complemento => "MyString",
      :DESC_Pontoreferencia => "MyString",
      :NUMR_Cep => 1,
      :sivic_cidade => nil
    ))
  end

  it "renders the edit sivic_endereco form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_endereco_path(@sivic_endereco), "post" do
      assert_select "input#sivic_endereco_DESC_Bairro[name=?]", "sivic_endereco[DESC_Bairro]"
      assert_select "input#sivic_endereco_DESC_Rua[name=?]", "sivic_endereco[DESC_Rua]"
      assert_select "input#sivic_endereco_DESC_Complemento[name=?]", "sivic_endereco[DESC_Complemento]"
      assert_select "input#sivic_endereco_DESC_Pontoreferencia[name=?]", "sivic_endereco[DESC_Pontoreferencia]"
      assert_select "input#sivic_endereco_NUMR_Cep[name=?]", "sivic_endereco[NUMR_Cep]"
      assert_select "input#sivic_endereco_sivic_cidade[name=?]", "sivic_endereco[sivic_cidade]"
    end
  end
end
