require 'spec_helper'

describe "sivic_lancamentos/new" do
  before(:each) do
    assign(:sivic_lancamento, stub_model(SivicLancamento,
      :nome_lancamento => "MyString",
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
    ).as_new_record)
  end

  it "renders new sivic_lancamento form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_lancamentos_path, "post" do
      assert_select "input#sivic_lancamento_nome_lancamento[name=?]", "sivic_lancamento[nome_lancamento]"
      assert_select "input#sivic_lancamento_valr_lancamento[name=?]", "sivic_lancamento[valr_lancamento]"
      assert_select "input#sivic_lancamento_flag_pago[name=?]", "sivic_lancamento[flag_pago]"
      assert_select "input#sivic_lancamento_flag_dizimo[name=?]", "sivic_lancamento[flag_dizimo]"
      assert_select "input#sivic_lancamento_numr_recorrencia[name=?]", "sivic_lancamento[numr_recorrencia]"
      assert_select "input#sivic_lancamento_sivic_category[name=?]", "sivic_lancamento[sivic_category]"
      assert_select "input#sivic_lancamento_sivic_centrocusto[name=?]", "sivic_lancamento[sivic_centrocusto]"
      assert_select "input#sivic_lancamento_sivic_rede[name=?]", "sivic_lancamento[sivic_rede]"
      assert_select "input#sivic_lancamento_sivic_tipmovfinanceiro[name=?]", "sivic_lancamento[sivic_tipmovfinanceiro]"
      assert_select "input#sivic_lancamento_sivic_pessoa[name=?]", "sivic_lancamento[sivic_pessoa]"
      assert_select "input#sivic_lancamento_sivic_fornecedor[name=?]", "sivic_lancamento[sivic_fornecedor]"
      assert_select "input#sivic_lancamento_sivic_igreja[name=?]", "sivic_lancamento[sivic_igreja]"
      assert_select "input#sivic_lancamento_user[name=?]", "sivic_lancamento[user]"
      assert_select "input#sivic_lancamento_user[name=?]", "sivic_lancamento[user]"
    end
  end
end
