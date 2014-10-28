require 'spec_helper'

describe "sivic_estados/show" do
  before(:each) do
    @sivic_estado = assign(:sivic_estado, stub_model(SivicEstado,
      :nome_estado => "Nome Estado",
      :sigl_estado => "Sigl Estado"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome Estado/)
    rendered.should match(/Sigl Estado/)
  end
end
