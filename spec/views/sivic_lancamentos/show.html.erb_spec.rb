require 'spec_helper'

describe "sivic_lancamentos/show" do
  before(:each) do
    @sivic_lancamento = assign(:sivic_lancamento, stub_model(SivicLancamento,
      :nome_lancamento => "Nome Lancamento",
      :valr_lancamento => "9.99",
      :flag_pago => false,
      :flag_dizimo => false,
      :numr_recorrencia => 1,
      :sivic_category => nil,
      :sivic_centrocusto => nil,
      :sivic_rede => nil,
      :sivic_tipmovfinanceiro => nil,
      :sivic_pessoa => nil,
      :sivic_fornecedor => nil,
      :sivic_igreja => nil,
      :user => nil,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome Lancamento/)
    rendered.should match(/9.99/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/1/)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
  end
end
