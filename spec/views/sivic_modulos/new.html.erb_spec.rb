require 'spec_helper'

describe "sivic_modulos/new" do
  before(:each) do
    assign(:sivic_modulo, stub_model(SivicModulo,
      :nome_modulo => "MyString",
      :desc_modulo => "MyString"
    ).as_new_record)
  end

  it "renders new sivic_modulo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_modulos_path, "post" do
      assert_select "input#sivic_modulo_nome_modulo[name=?]", "sivic_modulo[nome_modulo]"
      assert_select "input#sivic_modulo_desc_modulo[name=?]", "sivic_modulo[desc_modulo]"
    end
  end
end
