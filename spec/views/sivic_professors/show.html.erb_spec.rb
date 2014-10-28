require 'spec_helper'

describe "sivic_professors/show" do
  before(:each) do
    @sivic_professor = assign(:sivic_professor, stub_model(SivicProfessor,
      :sivic_pessoa => nil,
      :user => nil,
      :user => nil
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
