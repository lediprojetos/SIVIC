require 'spec_helper'

describe "sivic_aulas/index" do
  before(:each) do
    assign(:sivic_aulas, [
      stub_model(SivicAula,
        :nome_aula => "Nome Aula",
        :user => nil,
        :sivic_igreja => nil,
        :sivic_tumamoduloprofessor => nil
      ),
      stub_model(SivicAula,
        :nome_aula => "Nome Aula",
        :user => nil,
        :sivic_igreja => nil,
        :sivic_tumamoduloprofessor => nil
      )
    ])
  end

  it "renders a list of sivic_aulas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome Aula".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
