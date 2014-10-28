require 'spec_helper'

describe "sivic_relatorioscelulas/show" do
  before(:each) do
    @sivic_relatorioscelula = assign(:sivic_relatorioscelula, stub_model(SivicRelatorioscelula,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Desc Assunto Estudo/)
    rendered.should match(/Desc Texto Biblico/)
    rendered.should match(/9.99/)
    rendered.should match(/3/)
    rendered.should match(/MyText/)
    rendered.should match(/4/)
    rendered.should match(/5/)
    rendered.should match(/6/)
    rendered.should match(/7/)
    rendered.should match(/8/)
    rendered.should match(/9/)
    rendered.should match(/10/)
    rendered.should match(/11/)
    rendered.should match(/12/)
    rendered.should match(/13/)
  end
end
