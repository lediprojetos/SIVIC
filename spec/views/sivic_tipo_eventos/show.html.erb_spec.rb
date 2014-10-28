require 'spec_helper'

describe "sivic_tipo_eventos/show" do
  before(:each) do
    @sivic_tipo_evento = assign(:sivic_tipo_evento, stub_model(SivicTipoEvento,
      :desc_tipoevento => "Desc Tipoevento",
      :sivic_igreja => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Desc Tipoevento/)
    rendered.should match(//)
  end
end
