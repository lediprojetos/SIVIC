require 'spec_helper'

describe "sivic_sitpartcelulas/new" do
  before(:each) do
    assign(:sivic_sitpartcelula, stub_model(SivicSitpartcelula,
      :DESC_situacao => "MyString",
      :sivic_igreja => nil
    ).as_new_record)
  end

  it "renders new sivic_sitpartcelula form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_sitpartcelulas_path, "post" do
      assert_select "input#sivic_sitpartcelula_DESC_situacao[name=?]", "sivic_sitpartcelula[DESC_situacao]"
      assert_select "input#sivic_sitpartcelula_sivic_igreja[name=?]", "sivic_sitpartcelula[sivic_igreja]"
    end
  end
end
