require 'spec_helper'

describe "sivic_escolaridades/index" do
  before(:each) do
    assign(:sivic_escolaridades, [
      stub_model(SivicEscolaridade,
        :escolaridade => "Escolaridade"
      ),
      stub_model(SivicEscolaridade,
        :escolaridade => "Escolaridade"
      )
    ])
  end

  it "renders a list of sivic_escolaridades" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Escolaridade".to_s, :count => 2
  end
end
