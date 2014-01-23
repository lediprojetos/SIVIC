require 'spec_helper'

describe "sivic_partevenrelacelulas/index" do
  before(:each) do
    assign(:sivic_partevenrelacelulas, [
      stub_model(SivicPartevenrelacelula,
        :sivic_relatorioscelula => "Sivic Relatorioscelula",
        : => nil,
        :sivic_participantecelula => nil,
        :DESC_SituacaoParticipante => "Desc Situacao Participante"
      ),
      stub_model(SivicPartevenrelacelula,
        :sivic_relatorioscelula => "Sivic Relatorioscelula",
        : => nil,
        :sivic_participantecelula => nil,
        :DESC_SituacaoParticipante => "Desc Situacao Participante"
      )
    ])
  end

  it "renders a list of sivic_partevenrelacelulas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Sivic Relatorioscelula".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Desc Situacao Participante".to_s, :count => 2
  end
end
