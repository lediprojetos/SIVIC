require 'spec_helper'

describe "sivic_situacaoatividades/edit" do
  before(:each) do
    @sivic_situacaoatividade = assign(:sivic_situacaoatividade, stub_model(SivicSituacaoatividade,
      :nome => "MyString"
    ))
  end

  it "renders the edit sivic_situacaoatividade form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_situacaoatividade_path(@sivic_situacaoatividade), "post" do
      assert_select "input#sivic_situacaoatividade_nome[name=?]", "sivic_situacaoatividade[nome]"
    end
  end
end
