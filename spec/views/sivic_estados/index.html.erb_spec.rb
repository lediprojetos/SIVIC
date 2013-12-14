require 'spec_helper'

describe "sivic_estados/index" do
  before(:each) do
    assign(:sivic_estados, [
      stub_model(SivicEstado,
        :nome => "Nome",
        :sigla => "Sigla"
      ),
      stub_model(SivicEstado,
        :nome => "Nome",
        :sigla => "Sigla"
      )
    ])
  end

  it "renders a list of sivic_estados" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Sigla".to_s, :count => 2
  end
end
