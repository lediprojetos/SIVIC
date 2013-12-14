require 'spec_helper'

describe "sivic_cidades/show" do
  before(:each) do
    @sivic_cidade = assign(:sivic_cidade, stub_model(SivicCidade,
      :nome => "Nome",
      :estado_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome/)
    rendered.should match(/1/)
  end
end
