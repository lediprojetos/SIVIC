require 'spec_helper'

describe "sivic_bancos/new" do
  before(:each) do
    assign(:sivic_banco, stub_model(SivicBanco,
      :nome_banco => "MyString",
      :numr_codigo => 1
    ).as_new_record)
  end

  it "renders new sivic_banco form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_bancos_path, "post" do
      assert_select "input#sivic_banco_nome_banco[name=?]", "sivic_banco[nome_banco]"
      assert_select "input#sivic_banco_numr_codigo[name=?]", "sivic_banco[numr_codigo]"
    end
  end
end
