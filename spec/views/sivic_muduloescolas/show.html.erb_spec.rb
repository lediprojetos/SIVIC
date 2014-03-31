require 'spec_helper'

describe "sivic_muduloescolas/show" do
  before(:each) do
    @sivic_muduloescola = assign(:sivic_muduloescola, stub_model(SivicMuduloescola,
      :sivic_igreja => nil,
      :user => nil,
      :nome_modulo => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
  end
end
