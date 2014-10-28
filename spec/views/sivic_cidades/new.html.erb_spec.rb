require 'spec_helper'

describe "sivic_cidades/new" do
  before(:each) do
    assign(:sivic_cidade, stub_model(SivicCidade,
      :nome_cidade => "MyString",
      :sivic_estado => nil
    ).as_new_record)
  end

  it "renders new sivic_cidade form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_cidades_path, "post" do
      assert_select "input#sivic_cidade_nome_cidade[name=?]", "sivic_cidade[nome_cidade]"
      assert_select "input#sivic_cidade_sivic_estado[name=?]", "sivic_cidade[sivic_estado]"
    end
  end
end
