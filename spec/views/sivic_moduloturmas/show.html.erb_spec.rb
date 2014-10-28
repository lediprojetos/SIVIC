require 'spec_helper'

describe "sivic_moduloturmas/show" do
  before(:each) do
    @sivic_moduloturma = assign(:sivic_moduloturma, stub_model(SivicModuloturma,
      :sivic_moduloescola => nil,
      :sivic_turma => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
  end
end
