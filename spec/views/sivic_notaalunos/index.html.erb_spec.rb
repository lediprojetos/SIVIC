require 'spec_helper'

describe "sivic_notaalunos/index" do
  before(:each) do
    assign(:sivic_notaalunos, [
      stub_model(SivicNotaaluno,
        :nota => "",
        :sivic_licao => nil,
        :sivic_turmaaluno => nil,
        :user => nil
      ),
      stub_model(SivicNotaaluno,
        :nota => "",
        :sivic_licao => nil,
        :sivic_turmaaluno => nil,
        :user => nil
      )
    ])
  end

  it "renders a list of sivic_notaalunos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
