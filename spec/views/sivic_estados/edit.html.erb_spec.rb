require 'spec_helper'

describe "sivic_estados/edit" do
  before(:each) do
    @sivic_estado = assign(:sivic_estado, stub_model(SivicEstado,
      :nome_estado => "MyString",
      :sigl_estado => "MyString"
    ))
  end

  it "renders the edit sivic_estado form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_estado_path(@sivic_estado), "post" do
      assert_select "input#sivic_estado_nome_estado[name=?]", "sivic_estado[nome_estado]"
      assert_select "input#sivic_estado_sigl_estado[name=?]", "sivic_estado[sigl_estado]"
    end
  end
end
