require 'spec_helper'

describe "sivic_muduloescolas/index" do
  before(:each) do
    assign(:sivic_muduloescolas, [
      stub_model(SivicMuduloescola,
        :sivic_igreja => nil,
        :user => nil,
        :nome_modulo => ""
      ),
      stub_model(SivicMuduloescola,
        :sivic_igreja => nil,
        :user => nil,
        :nome_modulo => ""
      )
    ])
  end

  it "renders a list of sivic_muduloescolas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
