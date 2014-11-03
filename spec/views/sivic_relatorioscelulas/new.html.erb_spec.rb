require 'spec_helper'

describe "sivic_relatorioscelulas/new" do
  before(:each) do
    assign(:sivic_relatorioscelula, stub_model(SivicRelatorioscelula,
      :sivic_celula => nil,
      :NUMR_NumVisitante => 1,
      :NUMR_NumParticipante => 1,
      :DESC_AssuntoEstudo => "MyString",
      :DESC_TextoBiblico => "MyString",
      :VALR_Oferta => "9.99",
      :NUMR_Decisoes => 1,
      :DESC_OutrasInformacoes => "MyText",
      :FLAG_Situacao => 1,
      :NUMR_QtdNovoConvertido => 1,
      :NUMR_QtdResgate => 1,
      :NUMR_QtdPreEncontro => 1,
      :NUMR_QtdEncontro => 1,
      :NUMR_QtdPosEncontro => 1,
      :NUMR_QtdEscoLid1 => 1,
      :NUMR_EscoLid2 => 1,
      :NUMR_EscoLid3 => 1,
      :NUMR_QtdLidCelula => 1
    ).as_new_record)
  end

  it "renders new sivic_relatorioscelula form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_relatorioscelulas_path, "post" do
      assert_select "input#sivic_relatorioscelula_sivic_celula[name=?]", "sivic_relatorioscelula[sivic_celula]"
      assert_select "input#sivic_relatorioscelula_NUMR_NumVisitante[name=?]", "sivic_relatorioscelula[NUMR_NumVisitante]"
      assert_select "input#sivic_relatorioscelula_NUMR_NumParticipante[name=?]", "sivic_relatorioscelula[NUMR_NumParticipante]"
      assert_select "input#sivic_relatorioscelula_DESC_AssuntoEstudo[name=?]", "sivic_relatorioscelula[DESC_AssuntoEstudo]"
      assert_select "input#sivic_relatorioscelula_DESC_TextoBiblico[name=?]", "sivic_relatorioscelula[DESC_TextoBiblico]"
      assert_select "input#sivic_relatorioscelula_VALR_Oferta[name=?]", "sivic_relatorioscelula[VALR_Oferta]"
      assert_select "input#sivic_relatorioscelula_NUMR_Decisoes[name=?]", "sivic_relatorioscelula[NUMR_Decisoes]"
      assert_select "textarea#sivic_relatorioscelula_DESC_OutrasInformacoes[name=?]", "sivic_relatorioscelula[DESC_OutrasInformacoes]"
      assert_select "input#sivic_relatorioscelula_FLAG_Situacao[name=?]", "sivic_relatorioscelula[FLAG_Situacao]"
      assert_select "input#sivic_relatorioscelula_NUMR_QtdNovoConvertido[name=?]", "sivic_relatorioscelula[NUMR_QtdNovoConvertido]"
      assert_select "input#sivic_relatorioscelula_NUMR_QtdResgate[name=?]", "sivic_relatorioscelula[NUMR_QtdResgate]"
      assert_select "input#sivic_relatorioscelula_NUMR_QtdPreEncontro[name=?]", "sivic_relatorioscelula[NUMR_QtdPreEncontro]"
      assert_select "input#sivic_relatorioscelula_NUMR_QtdEncontro[name=?]", "sivic_relatorioscelula[NUMR_QtdEncontro]"
      assert_select "input#sivic_relatorioscelula_NUMR_QtdPosEncontro[name=?]", "sivic_relatorioscelula[NUMR_QtdPosEncontro]"
      assert_select "input#sivic_relatorioscelula_NUMR_QtdEscoLid1[name=?]", "sivic_relatorioscelula[NUMR_QtdEscoLid1]"
      assert_select "input#sivic_relatorioscelula_NUMR_EscoLid2[name=?]", "sivic_relatorioscelula[NUMR_EscoLid2]"
      assert_select "input#sivic_relatorioscelula_NUMR_EscoLid3[name=?]", "sivic_relatorioscelula[NUMR_EscoLid3]"
      assert_select "input#sivic_relatorioscelula_NUMR_QtdLidCelula[name=?]", "sivic_relatorioscelula[NUMR_QtdLidCelula]"
    end
  end
end
