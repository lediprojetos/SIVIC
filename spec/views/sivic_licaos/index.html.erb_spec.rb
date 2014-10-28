require 'spec_helper'

describe "sivic_licaos/index" do
  before(:each) do
    assign(:sivic_licaos, [
      stub_model(SivicLicao,
        :nome_licao => "Nome Licao",
        :user => nil,
        :sivic_igreja => nil,
        :sivic_turmamoduloprofessor => nil
      ),
      stub_model(SivicLicao,
        :nome_licao => "Nome Licao",
        :user => nil,
        :sivic_igreja => nil,
        :sivic_turmamoduloprofessor => nil
      )
    ])
  end

  it "renders a list of sivic_licaos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome Licao".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
