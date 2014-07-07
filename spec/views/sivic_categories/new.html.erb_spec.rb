require 'spec_helper'

describe "sivic_categories/new" do
  before(:each) do
    assign(:sivic_category, stub_model(SivicCategory,
      :nome_categoria => "MyString",
      :tipo_categoria => 1,
      :sivic_igreja => nil,
      :user => nil
    ).as_new_record)
  end

  it "renders new sivic_category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_categories_path, "post" do
      assert_select "input#sivic_category_nome_categoria[name=?]", "sivic_category[nome_categoria]"
      assert_select "input#sivic_category_tipo_categoria[name=?]", "sivic_category[tipo_categoria]"
      assert_select "input#sivic_category_sivic_igreja[name=?]", "sivic_category[sivic_igreja]"
      assert_select "input#sivic_category_user[name=?]", "sivic_category[user]"
    end
  end
end
