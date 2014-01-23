require 'spec_helper'

describe "sivic_participantecelulas/show" do
  before(:each) do
    @sivic_participantecelula = assign(:sivic_participantecelula, stub_model(SivicParticipantecelula,
      :NOME_Participante => "Nome Participante",
      :DESC_Email => "Desc Email",
      :NUMR_Telefone => "Numr Telefone",
      :DESC_SituacaoParticipante => "Desc Situacao Participante"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome Participante/)
    rendered.should match(/Desc Email/)
    rendered.should match(/Numr Telefone/)
    rendered.should match(/Desc Situacao Participante/)
  end
end
