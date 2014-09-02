require 'spec_helper'

describe "sivic_ministeriodiscipulos/index" do
  before(:each) do
    assign(:sivic_ministeriodiscipulos, [
      stub_model(SivicMinisteriodiscipulo,
        :sivic_discipulo => nil,
        :sivic_ministerio => nil,
        :flag_ministerioativo => false
      ),
      stub_model(SivicMinisteriodiscipulo,
        :sivic_discipulo => nil,
        :sivic_ministerio => nil,
        :flag_ministerioativo => false
      )
    ])
  end

  it "renders a list of sivic_ministeriodiscipulos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
