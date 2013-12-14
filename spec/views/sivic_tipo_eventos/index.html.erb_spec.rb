require 'spec_helper'

describe "sivic_tipo_eventos/index" do
  before(:each) do
    assign(:sivic_tipo_eventos, [
      stub_model(SivicTipoEvento,
        :nome => "Nome",
        :igreja_id => 1
      ),
      stub_model(SivicTipoEvento,
        :nome => "Nome",
        :igreja_id => 1
      )
    ])
  end

  it "renders a list of sivic_tipo_eventos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
