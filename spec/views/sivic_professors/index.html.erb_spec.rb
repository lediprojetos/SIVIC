require 'spec_helper'

describe "sivic_professors/index" do
  before(:each) do
    assign(:sivic_professors, [
      stub_model(SivicProfessor,
        :sivic_pessoa => nil,
        :user => nil,
        :user => nil
      ),
      stub_model(SivicProfessor,
        :sivic_pessoa => nil,
        :user => nil,
        :user => nil
      )
    ])
  end

  it "renders a list of sivic_professors" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
