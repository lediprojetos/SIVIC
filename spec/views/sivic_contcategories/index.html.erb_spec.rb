require 'spec_helper'

describe "sivic_contcategories/index" do
  before(:each) do
    assign(:sivic_contcategories, [
      stub_model(SivicContcategory,
        :numr_contador => 1,
        :sivic_igreja => nil
      ),
      stub_model(SivicContcategory,
        :numr_contador => 1,
        :sivic_igreja => nil
      )
    ])
  end

  it "renders a list of sivic_contcategories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
