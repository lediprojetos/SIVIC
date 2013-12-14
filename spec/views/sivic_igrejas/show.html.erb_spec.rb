require 'spec_helper'

describe "sivic_igrejas/show" do
  before(:each) do
    @sivic_igreja = assign(:sivic_igreja, stub_model(SivicIgreja,
      :nome => "Nome",
      :igrejaSede_id => 1,
      :endereco_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
