require 'spec_helper'

describe "sivic_turmamoduloprofessors/show" do
  before(:each) do
    @sivic_turmamoduloprofessor = assign(:sivic_turmamoduloprofessor, stub_model(SivicTurmamoduloprofessor,
      :sivic_professors => nil,
      :sivic_moduloescolas => nil,
      :sivic_turmas => nil
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
