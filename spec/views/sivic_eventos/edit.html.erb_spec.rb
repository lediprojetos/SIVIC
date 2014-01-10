require 'spec_helper'

describe "sivic_eventos/edit" do
  before(:each) do
    @sivic_evento = assign(:sivic_evento, stub_model(SivicEvento,
      :DESC_evento => "MyString",
      :DESC_resumo => "MyText",
      :VARL_inscricao => "9.99",
      :FLAG_ilimitado => 1,
      :NUMR_qdtVagas => 1,
      :sivic_user => nil,
      :sivic_igreja => nil,
      :sivic_endereco => nil,
      :sivic_tipoEvento => nil
    ))
  end

  it "renders the edit sivic_evento form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_evento_path(@sivic_evento), "post" do
      assert_select "input#sivic_evento_DESC_evento[name=?]", "sivic_evento[DESC_evento]"
      assert_select "textarea#sivic_evento_DESC_resumo[name=?]", "sivic_evento[DESC_resumo]"
      assert_select "input#sivic_evento_VARL_inscricao[name=?]", "sivic_evento[VARL_inscricao]"
      assert_select "input#sivic_evento_FLAG_ilimitado[name=?]", "sivic_evento[FLAG_ilimitado]"
      assert_select "input#sivic_evento_NUMR_qdtVagas[name=?]", "sivic_evento[NUMR_qdtVagas]"
      assert_select "input#sivic_evento_sivic_user[name=?]", "sivic_evento[sivic_user]"
      assert_select "input#sivic_evento_sivic_igreja[name=?]", "sivic_evento[sivic_igreja]"
      assert_select "input#sivic_evento_sivic_endereco[name=?]", "sivic_evento[sivic_endereco]"
      assert_select "input#sivic_evento_sivic_tipoEvento[name=?]", "sivic_evento[sivic_tipoEvento]"
    end
  end
end
