require 'spec_helper'

describe "sivic_igrejas/index" do
  before(:each) do
    assign(:sivic_igrejas, [
      stub_model(SivicIgreja,
        :nome => "Nome",
        :igrejaSede_id => 1,
        :endereco_id => 2
      ),
      stub_model(SivicIgreja,
        :nome => "Nome",
        :igrejaSede_id => 1,
        :endereco_id => 2
      )
    ])
  end

  it "renders a list of sivic_igrejas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
