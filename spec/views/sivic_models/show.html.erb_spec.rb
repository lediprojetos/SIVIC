require 'spec_helper'

describe "sivic_models/show" do
  before(:each) do
    @sivic_model = assign(:sivic_model, stub_model(SivicModel,
      :nome_model => "Nome Model",
      :desc_model => "Desc Model"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome Model/)
    rendered.should match(/Desc Model/)
  end
end
