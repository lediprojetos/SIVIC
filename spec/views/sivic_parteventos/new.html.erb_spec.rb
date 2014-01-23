require 'spec_helper'

describe "sivic_parteventos/new" do
  before(:each) do
    assign(:sivic_partevento, stub_model(SivicPartevento,
      :sivic_pessoa => nil,
      :sivic_evento => nil,
      :sivic_movimentofinanceiro => nil,
      :FLAG_naoparticipou => false
    ).as_new_record)
  end

  it "renders new sivic_partevento form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_parteventos_path, "post" do
      assert_select "input#sivic_partevento_sivic_pessoa[name=?]", "sivic_partevento[sivic_pessoa]"
      assert_select "input#sivic_partevento_sivic_evento[name=?]", "sivic_partevento[sivic_evento]"
      assert_select "input#sivic_partevento_sivic_movimentofinanceiro[name=?]", "sivic_partevento[sivic_movimentofinanceiro]"
      assert_select "input#sivic_partevento_FLAG_naoparticipou[name=?]", "sivic_partevento[FLAG_naoparticipou]"
    end
  end
end
