require 'spec_helper'

describe "sivic_celulas/show" do
  before(:each) do
    @sivic_celula = assign(:sivic_celula, stub_model(SivicCelula,
      :sivic_pessoa => nil,
      :sivic_endereco => nil,
      :NUMR_Dia => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/1/)
  end
end
