require 'spec_helper'

describe "sivic_contdiscipulos/show" do
  before(:each) do
    @sivic_contdiscipulo = assign(:sivic_contdiscipulo, stub_model(SivicContdiscipulo,
      :NUMR_Contador => 1,
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
