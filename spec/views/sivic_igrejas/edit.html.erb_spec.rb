require 'spec_helper'

describe "sivic_igrejas/edit" do
  before(:each) do
    @sivic_igreja = assign(:sivic_igreja, stub_model(SivicIgreja,
      :NOME_igreja => "MyString",
      :NUMR_telefone => "MyString",
      :NOME_responsavel => "MyString",
      :NUMR_cnpj => "MyString",
      :sivic_endereco => nil
    ))
  end

  it "renders the edit sivic_igreja form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_igreja_path(@sivic_igreja), "post" do
      assert_select "input#sivic_igreja_NOME_igreja[name=?]", "sivic_igreja[NOME_igreja]"
      assert_select "input#sivic_igreja_NUMR_telefone[name=?]", "sivic_igreja[NUMR_telefone]"
      assert_select "input#sivic_igreja_NOME_responsavel[name=?]", "sivic_igreja[NOME_responsavel]"
      assert_select "input#sivic_igreja_NUMR_cnpj[name=?]", "sivic_igreja[NUMR_cnpj]"
      assert_select "input#sivic_igreja_sivic_endereco[name=?]", "sivic_igreja[sivic_endereco]"
    end
  end
end
