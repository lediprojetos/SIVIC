require 'spec_helper'

describe "sivic_ministerios/show" do
  before(:each) do
    @sivic_ministerio = assign(:sivic_ministerio, stub_model(SivicMinisterio,
      :nome_ministerio => "Nome Ministerio",
      :sigl_ministerio => "Sigl Ministerio",
      :sivic_igreja => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome Ministerio/)
    rendered.should match(/Sigl Ministerio/)
    rendered.should match(//)
  end
end
