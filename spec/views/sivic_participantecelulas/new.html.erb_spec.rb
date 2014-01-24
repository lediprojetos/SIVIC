require 'spec_helper'

describe "sivic_participantecelulas/new" do
  before(:each) do
    assign(:sivic_participantecelula, stub_model(SivicParticipantecelula,
      :NOME_Participante => "MyString",
      :DESC_Email => "MyString",
      :NUMR_Telefone => "MyString",
      :DESC_SituacaoParticipante => "MyString"
    ).as_new_record)
  end

  it "renders new sivic_participantecelula form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_participantecelulas_path, "post" do
      assert_select "input#sivic_participantecelula_NOME_Participante[name=?]", "sivic_participantecelula[NOME_Participante]"
      assert_select "input#sivic_participantecelula_DESC_Email[name=?]", "sivic_participantecelula[DESC_Email]"
      assert_select "input#sivic_participantecelula_NUMR_Telefone[name=?]", "sivic_participantecelula[NUMR_Telefone]"
      assert_select "input#sivic_participantecelula_DESC_SituacaoParticipante[name=?]", "sivic_participantecelula[DESC_SituacaoParticipante]"
    end
  end
end
