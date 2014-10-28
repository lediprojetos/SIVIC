require 'spec_helper'

describe "sivic_turmamoduloprofessors/index" do
  before(:each) do
    assign(:sivic_turmamoduloprofessors, [
      stub_model(SivicTurmamoduloprofessor,
        :sivic_professors => nil,
        :sivic_moduloescolas => nil,
        :sivic_turmas => nil
      ),
      stub_model(SivicTurmamoduloprofessor,
        :sivic_professors => nil,
        :sivic_moduloescolas => nil,
        :sivic_turmas => nil
      )
    ])
  end

  it "renders a list of sivic_turmamoduloprofessors" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
