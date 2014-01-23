require 'spec_helper'

describe "sivic_partevenrelacelulas/new" do
  before(:each) do
    assign(:sivic_partevenrelacelula, stub_model(SivicPartevenrelacelula,
      :sivic_relatorioscelula => "MyString",
      : => nil,
      :sivic_participantecelula => nil,
      :DESC_SituacaoParticipante => "MyString"
    ).as_new_record)
  end

  it "renders new sivic_partevenrelacelula form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_partevenrelacelulas_path, "post" do
      assert_select "input#sivic_partevenrelacelula_sivic_relatorioscelula[name=?]", "sivic_partevenrelacelula[sivic_relatorioscelula]"
      assert_select "input#sivic_partevenrelacelula_[name=?]", "sivic_partevenrelacelula[]"
      assert_select "input#sivic_partevenrelacelula_sivic_participantecelula[name=?]", "sivic_partevenrelacelula[sivic_participantecelula]"
      assert_select "input#sivic_partevenrelacelula_DESC_SituacaoParticipante[name=?]", "sivic_partevenrelacelula[DESC_SituacaoParticipante]"
    end
  end
end
