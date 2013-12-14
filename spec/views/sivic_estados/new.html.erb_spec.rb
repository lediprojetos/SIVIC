require 'spec_helper'

describe "sivic_estados/new" do
  before(:each) do
    assign(:sivic_estado, stub_model(SivicEstado,
      :nome => "MyString",
      :sigla => "MyString"
    ).as_new_record)
  end

  it "renders new sivic_estado form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_estados_path, "post" do
      assert_select "input#sivic_estado_nome[name=?]", "sivic_estado[nome]"
      assert_select "input#sivic_estado_sigla[name=?]", "sivic_estado[sigla]"
    end
  end
end
