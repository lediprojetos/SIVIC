require 'spec_helper'

describe "sivic_categories/edit" do
  before(:each) do
    @sivic_category = assign(:sivic_category, stub_model(SivicCategory,
      :nome_categoria => "MyString",
      :tipo_categoria => 1,
      :sivic_igreja => nil,
      :user => nil
    ))
  end

  it "renders the edit sivic_category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_category_path(@sivic_category), "post" do
      assert_select "input#sivic_category_nome_categoria[name=?]", "sivic_category[nome_categoria]"
      assert_select "input#sivic_category_tipo_categoria[name=?]", "sivic_category[tipo_categoria]"
      assert_select "input#sivic_category_sivic_igreja[name=?]", "sivic_category[sivic_igreja]"
      assert_select "input#sivic_category_user[name=?]", "sivic_category[user]"
    end
  end
end
