require 'spec_helper'

describe "sivic_escolaridades/show" do
  before(:each) do
    @sivic_escolaridade = assign(:sivic_escolaridade, stub_model(SivicEscolaridade,
      :escolaridade => "Escolaridade"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Escolaridade/)
  end
end
