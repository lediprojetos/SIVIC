require 'spec_helper'

describe "sivic_planos/new" do
  before(:each) do
    assign(:sivic_plano, stub_model(SivicPlano,
      :nome_plano => "MyString",
      :numr_qtdmembro => 1,
      :numr_qtdusuario => 1
    ).as_new_record)
  end

  it "renders new sivic_plano form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_planos_path, "post" do
      assert_select "input#sivic_plano_nome_plano[name=?]", "sivic_plano[nome_plano]"
      assert_select "input#sivic_plano_numr_qtdmembro[name=?]", "sivic_plano[numr_qtdmembro]"
      assert_select "input#sivic_plano_numr_qtdusuario[name=?]", "sivic_plano[numr_qtdusuario]"
    end
  end
end
