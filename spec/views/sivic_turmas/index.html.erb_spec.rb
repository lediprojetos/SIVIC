require 'spec_helper'

describe "sivic_turmas/index" do
  before(:each) do
    assign(:sivic_turmas, [
      stub_model(SivicTurma,
        :sivic_igreja => nil,
        :user => nil,
        :user => nil,
        :DESC_turma => "Desc Turma",
        :NUMR_QdtVagas => 1
      ),
      stub_model(SivicTurma,
        :sivic_igreja => nil,
        :user => nil,
        :user => nil,
        :DESC_turma => "Desc Turma",
        :NUMR_QdtVagas => 1
      )
    ])
  end

  it "renders a list of sivic_turmas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Desc Turma".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
