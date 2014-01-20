require 'spec_helper'

describe "sivic_movimentofinanceiros/show" do
  before(:each) do
    @sivic_movimentofinanceiro = assign(:sivic_movimentofinanceiro, stub_model(SivicMovimentofinanceiro,
      :VALR_movimento => "9.99",
      :User => nil,
      :FLAG_baixa => "Flag Baixa",
      :User => nil,
      :sivic_tipmovfinanceiro => nil,
      :sivic_evento => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    rendered.should match(//)
    rendered.should match(/Flag Baixa/)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
  end
end
