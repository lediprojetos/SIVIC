require 'spec_helper'

describe "sivic_turmaalunos/show" do
  before(:each) do
    @sivic_turmaaluno = assign(:sivic_turmaaluno, stub_model(SivicTurmaaluno,
      :sivic_turma => nil,
      :sivic_pessoa => nil,
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
