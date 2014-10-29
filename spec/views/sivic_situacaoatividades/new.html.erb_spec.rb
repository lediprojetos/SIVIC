require 'spec_helper'

describe "sivic_situacaoatividades/new" do
  before(:each) do
    assign(:sivic_situacaoatividade, stub_model(SivicSituacaoatividade,
      :nome => "MyString"
    ).as_new_record)
  end

  it "renders new sivic_situacaoatividade form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_situacaoatividades_path, "post" do
      assert_select "input#sivic_situacaoatividade_nome[name=?]", "sivic_situacaoatividade[nome]"
    end
  end
end
