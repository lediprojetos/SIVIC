require 'spec_helper'

describe "sivic_modulos/show" do
  before(:each) do
    @sivic_modulo = assign(:sivic_modulo, stub_model(SivicModulo,
      :nome_modulo => "Nome Modulo",
      :desc_modulo => "Desc Modulo"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome Modulo/)
    rendered.should match(/Desc Modulo/)
  end
end
