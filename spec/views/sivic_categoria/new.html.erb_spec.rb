require 'spec_helper'

describe "sivic_categoria/new" do
  before(:each) do
    assign(:sivic_categorium, stub_model(SivicCategorium,
      :nome_categoria => "MyString",
      :tipo_categoria => 1,
      :user => nil,
      :sivic_igreja => nil
    ).as_new_record)
  end

  it "renders new sivic_categorium form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_categoria_path, "post" do
      assert_select "input#sivic_categorium_nome_categoria[name=?]", "sivic_categorium[nome_categoria]"
      assert_select "input#sivic_categorium_tipo_categoria[name=?]", "sivic_categorium[tipo_categoria]"
      assert_select "input#sivic_categorium_user[name=?]", "sivic_categorium[user]"
      assert_select "input#sivic_categorium_sivic_igreja[name=?]", "sivic_categorium[sivic_igreja]"
    end
  end
end
