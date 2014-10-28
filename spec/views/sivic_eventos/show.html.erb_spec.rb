require 'spec_helper'

describe "sivic_eventos/show" do
  before(:each) do
    @sivic_evento = assign(:sivic_evento, stub_model(SivicEvento,
      :DESC_evento => "Desc Evento",
      :DESC_resumo => "MyText",
      :VARL_inscricao => "9.99",
      :FLAG_ilimitado => 1,
      :NUMR_qdtVagas => 2,
      :sivic_user => nil,
      :sivic_igreja => nil,
      :sivic_endereco => nil,
      :sivic_tipoEvento => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Desc Evento/)
    rendered.should match(/MyText/)
    rendered.should match(/9.99/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
  end
end
