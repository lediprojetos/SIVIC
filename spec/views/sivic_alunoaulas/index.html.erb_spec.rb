require 'spec_helper'

describe "sivic_alunoaulas/index" do
  before(:each) do
    assign(:sivic_alunoaulas, [
      stub_model(SivicAlunoaula,
        :sivic_turmaaluno => nil,
        :sivic_aula => nil,
        :flag_ausente => 1
      ),
      stub_model(SivicAlunoaula,
        :sivic_turmaaluno => nil,
        :sivic_aula => nil,
        :flag_ausente => 1
      )
    ])
  end

  it "renders a list of sivic_alunoaulas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
