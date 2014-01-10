require 'spec_helper'

describe "sivic_eventos/index" do
  before(:each) do
    assign(:sivic_eventos, [
      stub_model(SivicEvento,
        :DESC_evento => "Desc Evento",
        :DESC_resumo => "MyText",
        :VARL_inscricao => "9.99",
        :FLAG_ilimitado => 1,
        :NUMR_qdtVagas => 2,
        :sivic_user => nil,
        :sivic_igreja => nil,
        :sivic_endereco => nil,
        :sivic_tipoEvento => nil
      ),
      stub_model(SivicEvento,
        :DESC_evento => "Desc Evento",
        :DESC_resumo => "MyText",
        :VARL_inscricao => "9.99",
        :FLAG_ilimitado => 1,
        :NUMR_qdtVagas => 2,
        :sivic_user => nil,
        :sivic_igreja => nil,
        :sivic_endereco => nil,
        :sivic_tipoEvento => nil
      )
    ])
  end

  it "renders a list of sivic_eventos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Desc Evento".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
