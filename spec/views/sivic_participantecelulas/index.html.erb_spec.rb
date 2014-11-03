require 'spec_helper'

describe "sivic_participantecelulas/index" do
  before(:each) do
    assign(:sivic_participantecelulas, [
      stub_model(SivicParticipantecelula,
        :NOME_Participante => "Nome Participante",
        :DESC_Email => "Desc Email",
        :NUMR_Telefone => "Numr Telefone",
        :DESC_SituacaoParticipante => "Desc Situacao Participante"
      ),
      stub_model(SivicParticipantecelula,
        :NOME_Participante => "Nome Participante",
        :DESC_Email => "Desc Email",
        :NUMR_Telefone => "Numr Telefone",
        :DESC_SituacaoParticipante => "Desc Situacao Participante"
      )
    ])
  end

  it "renders a list of sivic_participantecelulas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome Participante".to_s, :count => 2
    assert_select "tr>td", :text => "Desc Email".to_s, :count => 2
    assert_select "tr>td", :text => "Numr Telefone".to_s, :count => 2
    assert_select "tr>td", :text => "Desc Situacao Participante".to_s, :count => 2
  end
end
