require 'spec_helper'

describe "sivic_escolaridades/edit" do
  before(:each) do
    @sivic_escolaridade = assign(:sivic_escolaridade, stub_model(SivicEscolaridade,
      :escolaridade => "MyString"
    ))
  end

  it "renders the edit sivic_escolaridade form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_escolaridade_path(@sivic_escolaridade), "post" do
      assert_select "input#sivic_escolaridade_escolaridade[name=?]", "sivic_escolaridade[escolaridade]"
    end
  end
end
