require 'spec_helper'

describe "sivic_escolaridades/new" do
  before(:each) do
    assign(:sivic_escolaridade, stub_model(SivicEscolaridade,
      :NOME_escolaridade => "MyString"
    ).as_new_record)
  end

  it "renders new sivic_escolaridade form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_escolaridades_path, "post" do
      assert_select "input#sivic_escolaridade_NOME_escolaridade[name=?]", "sivic_escolaridade[NOME_escolaridade]"
    end
  end
end
