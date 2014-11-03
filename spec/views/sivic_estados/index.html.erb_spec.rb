require 'spec_helper'

describe "sivic_estados/index" do
  before(:each) do
    assign(:sivic_estados, [
      stub_model(SivicEstado,
        :nome_estado => "Nome Estado",
        :sigl_estado => "Sigl Estado"
      ),
      stub_model(SivicEstado,
        :nome_estado => "Nome Estado",
        :sigl_estado => "Sigl Estado"
      )
    ])
  end

  it "renders a list of sivic_estados" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome Estado".to_s, :count => 2
    assert_select "tr>td", :text => "Sigl Estado".to_s, :count => 2
  end
end
