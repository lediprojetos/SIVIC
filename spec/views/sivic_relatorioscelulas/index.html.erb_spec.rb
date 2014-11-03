require 'spec_helper'

describe "sivic_relatorioscelulas/index" do
  before(:each) do
    assign(:sivic_relatorioscelulas, [
      stub_model(SivicRelatorioscelula,
        :sivic_celula => nil,
        :NUMR_NumVisitante => 1,
        :NUMR_NumParticipante => 2,
        :DESC_AssuntoEstudo => "Desc Assunto Estudo",
        :DESC_TextoBiblico => "Desc Texto Biblico",
        :VALR_Oferta => "9.99",
        :NUMR_Decisoes => 3,
        :DESC_OutrasInformacoes => "MyText",
        :FLAG_Situacao => 4,
        :NUMR_QtdNovoConvertido => 5,
        :NUMR_QtdResgate => 6,
        :NUMR_QtdPreEncontro => 7,
        :NUMR_QtdEncontro => 8,
        :NUMR_QtdPosEncontro => 9,
        :NUMR_QtdEscoLid1 => 10,
        :NUMR_EscoLid2 => 11,
        :NUMR_EscoLid3 => 12,
        :NUMR_QtdLidCelula => 13
      ),
      stub_model(SivicRelatorioscelula,
        :sivic_celula => nil,
        :NUMR_NumVisitante => 1,
        :NUMR_NumParticipante => 2,
        :DESC_AssuntoEstudo => "Desc Assunto Estudo",
        :DESC_TextoBiblico => "Desc Texto Biblico",
        :VALR_Oferta => "9.99",
        :NUMR_Decisoes => 3,
        :DESC_OutrasInformacoes => "MyText",
        :FLAG_Situacao => 4,
        :NUMR_QtdNovoConvertido => 5,
        :NUMR_QtdResgate => 6,
        :NUMR_QtdPreEncontro => 7,
        :NUMR_QtdEncontro => 8,
        :NUMR_QtdPosEncontro => 9,
        :NUMR_QtdEscoLid1 => 10,
        :NUMR_EscoLid2 => 11,
        :NUMR_EscoLid3 => 12,
        :NUMR_QtdLidCelula => 13
      )
    ])
  end

  it "renders a list of sivic_relatorioscelulas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Desc Assunto Estudo".to_s, :count => 2
    assert_select "tr>td", :text => "Desc Texto Biblico".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => 8.to_s, :count => 2
    assert_select "tr>td", :text => 9.to_s, :count => 2
    assert_select "tr>td", :text => 10.to_s, :count => 2
    assert_select "tr>td", :text => 11.to_s, :count => 2
    assert_select "tr>td", :text => 12.to_s, :count => 2
    assert_select "tr>td", :text => 13.to_s, :count => 2
  end
end
