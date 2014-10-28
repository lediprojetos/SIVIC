require 'spec_helper'

describe "sivic_userpermissaos/index" do
  before(:each) do
    assign(:sivic_userpermissaos, [
      stub_model(SivicUserpermissao,
        :sivic_permissao => nil,
        :user => nil
      ),
      stub_model(SivicUserpermissao,
        :sivic_permissao => nil,
        :user => nil
      )
    ])
  end

  it "renders a list of sivic_userpermissaos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
