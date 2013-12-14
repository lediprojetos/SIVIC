require 'spec_helper'

describe "sivic_cidades/edit" do
  before(:each) do
    @sivic_cidade = assign(:sivic_cidade, stub_model(SivicCidade,
      :nome => "MyString",
      :estado_id => 1
    ))
  end

  it "renders the edit sivic_cidade form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_cidade_path(@sivic_cidade), "post" do
      assert_select "input#sivic_cidade_nome[name=?]", "sivic_cidade[nome]"
      assert_select "input#sivic_cidade_estado_id[name=?]", "sivic_cidade[estado_id]"
    end
  end
end
