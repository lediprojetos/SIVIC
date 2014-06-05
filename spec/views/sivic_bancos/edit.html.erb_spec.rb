require 'spec_helper'

describe "sivic_bancos/edit" do
  before(:each) do
    @sivic_banco = assign(:sivic_banco, stub_model(SivicBanco,
      :nome_banco => "MyString",
      :numr_codigo => 1
    ))
  end

  it "renders the edit sivic_banco form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_banco_path(@sivic_banco), "post" do
      assert_select "input#sivic_banco_nome_banco[name=?]", "sivic_banco[nome_banco]"
      assert_select "input#sivic_banco_numr_codigo[name=?]", "sivic_banco[numr_codigo]"
    end
  end
end
