require 'spec_helper'

describe "sivic_ministeriodiscipulos/show" do
  before(:each) do
    @sivic_ministeriodiscipulo = assign(:sivic_ministeriodiscipulo, stub_model(SivicMinisteriodiscipulo,
      :sivic_discipulo => nil,
      :sivic_ministerio => nil,
      :flag_ministerioativo => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/false/)
  end
end
