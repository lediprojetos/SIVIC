require 'spec_helper'

describe "sivic_turmas/show" do
  before(:each) do
    @sivic_turma = assign(:sivic_turma, stub_model(SivicTurma,
      :sivic_igreja => nil,
      :user => nil,
      :user => nil,
      :DESC_turma => "Desc Turma",
      :NUMR_QdtVagas => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/Desc Turma/)
    rendered.should match(/1/)
  end
end
