require 'spec_helper'

describe "sivic_turmaalunos/index" do
  before(:each) do
    assign(:sivic_turmaalunos, [
      stub_model(SivicTurmaaluno,
        :sivic_turma => nil,
        :sivic_pessoa => nil,
        :user => nil
      ),
      stub_model(SivicTurmaaluno,
        :sivic_turma => nil,
        :sivic_pessoa => nil,
        :user => nil
      )
    ])
  end

  it "renders a list of sivic_turmaalunos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
