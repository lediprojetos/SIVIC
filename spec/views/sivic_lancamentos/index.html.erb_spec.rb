require 'spec_helper'

describe "sivic_lancamentos/index" do
  before(:each) do
    assign(:sivic_lancamentos, [
      stub_model(SivicLancamento,
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
      ),
      stub_model(SivicLancamento,
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
      )
    ])
  end

  it "renders a list of sivic_lancamentos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome Lancamento".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
