require 'spec_helper'

describe "sivic_moduloescolas/show" do
  before(:each) do
    @sivic_moduloescola = assign(:sivic_moduloescola, stub_model(SivicModuloescola,
      :sivic_igreja => nil,
      :user => nil,
      :nome_modulo => "Nome Modulo"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/Nome Modulo/)
  end
end
