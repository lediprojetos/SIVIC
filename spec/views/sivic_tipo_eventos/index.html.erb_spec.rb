require 'spec_helper'

describe "sivic_tipo_eventos/index" do
  before(:each) do
    assign(:sivic_tipo_eventos, [
      stub_model(SivicTipoEvento,
        :desc_tipoevento => "Desc Tipoevento",
        :sivic_igreja => nil
      ),
      stub_model(SivicTipoEvento,
        :desc_tipoevento => "Desc Tipoevento",
        :sivic_igreja => nil
      )
    ])
  end

  it "renders a list of sivic_tipo_eventos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Desc Tipoevento".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
