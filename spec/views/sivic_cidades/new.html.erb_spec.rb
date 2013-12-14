require 'spec_helper'

describe "sivic_cidades/new" do
  before(:each) do
    assign(:sivic_cidade, stub_model(SivicCidade,
      :nome => "MyString",
      :estado_id => 1
    ).as_new_record)
  end

  it "renders new sivic_cidade form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_cidades_path, "post" do
      assert_select "input#sivic_cidade_nome[name=?]", "sivic_cidade[nome]"
      assert_select "input#sivic_cidade_estado_id[name=?]", "sivic_cidade[estado_id]"
    end
  end
end
