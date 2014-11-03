require 'spec_helper'

describe "sivic_contcategories/show" do
  before(:each) do
    @sivic_contcategory = assign(:sivic_contcategory, stub_model(SivicContcategory,
      :numr_contador => 1,
      :sivic_igreja => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(//)
  end
end
