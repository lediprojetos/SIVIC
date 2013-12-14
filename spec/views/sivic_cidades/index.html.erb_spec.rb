require 'spec_helper'

describe "sivic_cidades/index" do
  before(:each) do
    assign(:sivic_cidades, [
      stub_model(SivicCidade,
        :nome => "Nome",
        :estado_id => 1
      ),
      stub_model(SivicCidade,
        :nome => "Nome",
        :estado_id => 1
      )
    ])
  end

  it "renders a list of sivic_cidades" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
