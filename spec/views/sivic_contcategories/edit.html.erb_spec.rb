require 'spec_helper'

describe "sivic_contcategories/edit" do
  before(:each) do
    @sivic_contcategory = assign(:sivic_contcategory, stub_model(SivicContcategory,
      :numr_contador => 1,
      :sivic_igreja => nil
    ))
  end

  it "renders the edit sivic_contcategory form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_contcategory_path(@sivic_contcategory), "post" do
      assert_select "input#sivic_contcategory_numr_contador[name=?]", "sivic_contcategory[numr_contador]"
      assert_select "input#sivic_contcategory_sivic_igreja[name=?]", "sivic_contcategory[sivic_igreja]"
    end
  end
end
