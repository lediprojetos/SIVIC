require 'spec_helper'

describe "sivic_contcategories/new" do
  before(:each) do
    assign(:sivic_contcategory, stub_model(SivicContcategory,
      :numr_contador => 1,
      :sivic_igreja => nil
    ).as_new_record)
  end

  it "renders new sivic_contcategory form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_contcategories_path, "post" do
      assert_select "input#sivic_contcategory_numr_contador[name=?]", "sivic_contcategory[numr_contador]"
      assert_select "input#sivic_contcategory_sivic_igreja[name=?]", "sivic_contcategory[sivic_igreja]"
    end
  end
end
