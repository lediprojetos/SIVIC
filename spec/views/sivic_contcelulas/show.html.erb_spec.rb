require 'spec_helper'

describe "sivic_contcelulas/show" do
  before(:each) do
    @sivic_contcelula = assign(:sivic_contcelula, stub_model(SivicContcelula,
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
