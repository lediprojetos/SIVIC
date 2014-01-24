require 'spec_helper'

describe "sivic_partevenrelacelulas/show" do
  before(:each) do
    @sivic_partevenrelacelula = assign(:sivic_partevenrelacelula, stub_model(SivicPartevenrelacelula,
      :sivic_relatorioscelula => "Sivic Relatorioscelula",
      : => nil,
      :sivic_participantecelula => nil,
      :DESC_SituacaoParticipante => "Desc Situacao Participante"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Sivic Relatorioscelula/)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/Desc Situacao Participante/)
  end
end
