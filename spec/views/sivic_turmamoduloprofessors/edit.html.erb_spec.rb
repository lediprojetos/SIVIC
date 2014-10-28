require 'spec_helper'

describe "sivic_turmamoduloprofessors/edit" do
  before(:each) do
    @sivic_turmamoduloprofessor = assign(:sivic_turmamoduloprofessor, stub_model(SivicTurmamoduloprofessor,
      :sivic_professors => nil,
      :sivic_moduloescolas => nil,
      :sivic_turmas => nil
    ))
  end

  it "renders the edit sivic_turmamoduloprofessor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_turmamoduloprofessor_path(@sivic_turmamoduloprofessor), "post" do
      assert_select "input#sivic_turmamoduloprofessor_sivic_professors[name=?]", "sivic_turmamoduloprofessor[sivic_professors]"
      assert_select "input#sivic_turmamoduloprofessor_sivic_moduloescolas[name=?]", "sivic_turmamoduloprofessor[sivic_moduloescolas]"
      assert_select "input#sivic_turmamoduloprofessor_sivic_turmas[name=?]", "sivic_turmamoduloprofessor[sivic_turmas]"
    end
  end
end
