require 'spec_helper'

describe "sivic_movimentofinanceiros/new" do
  before(:each) do
    assign(:sivic_movimentofinanceiro, stub_model(SivicMovimentofinanceiro,
      :VALR_movimento => "9.99",
      :User => nil,
      :FLAG_baixa => "MyString",
      :User => nil,
      :sivic_tipmovfinanceiro => nil,
      :sivic_evento => nil
    ).as_new_record)
  end

  it "renders new sivic_movimentofinanceiro form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_movimentofinanceiros_path, "post" do
      assert_select "input#sivic_movimentofinanceiro_VALR_movimento[name=?]", "sivic_movimentofinanceiro[VALR_movimento]"
      assert_select "input#sivic_movimentofinanceiro_User[name=?]", "sivic_movimentofinanceiro[User]"
      assert_select "input#sivic_movimentofinanceiro_FLAG_baixa[name=?]", "sivic_movimentofinanceiro[FLAG_baixa]"
      assert_select "input#sivic_movimentofinanceiro_User[name=?]", "sivic_movimentofinanceiro[User]"
      assert_select "input#sivic_movimentofinanceiro_sivic_tipmovfinanceiro[name=?]", "sivic_movimentofinanceiro[sivic_tipmovfinanceiro]"
      assert_select "input#sivic_movimentofinanceiro_sivic_evento[name=?]", "sivic_movimentofinanceiro[sivic_evento]"
    end
  end
end
