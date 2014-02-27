require 'spec_helper'

describe "sivic_situacoesrelatorios/edit" do
  before(:each) do
    @sivic_situacoesrelatorio = assign(:sivic_situacoesrelatorio, stub_model(SivicSituacoesrelatorio,
      :DESC_Situacao => "MyString"
    ))
  end

  it "renders the edit sivic_situacoesrelatorio form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_situacoesrelatorio_path(@sivic_situacoesrelatorio), "post" do
      assert_select "input#sivic_situacoesrelatorio_DESC_Situacao[name=?]", "sivic_situacoesrelatorio[DESC_Situacao]"
    end
  end
end
