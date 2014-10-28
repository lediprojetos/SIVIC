require 'spec_helper'

describe "sivic_movimentofinanceiros/index" do
  before(:each) do
    assign(:sivic_movimentofinanceiros, [
      stub_model(SivicMovimentofinanceiro,
        :VALR_movimento => "9.99",
        :User => nil,
        :FLAG_baixa => "Flag Baixa",
        :User => nil,
        :sivic_tipmovfinanceiro => nil,
        :sivic_evento => nil
      ),
      stub_model(SivicMovimentofinanceiro,
        :VALR_movimento => "9.99",
        :User => nil,
        :FLAG_baixa => "Flag Baixa",
        :User => nil,
        :sivic_tipmovfinanceiro => nil,
        :sivic_evento => nil
      )
    ])
  end

  it "renders a list of sivic_movimentofinanceiros" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Flag Baixa".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
