require 'spec_helper'

describe "sivic_situacoesrelatorios/new" do
  before(:each) do
    assign(:sivic_situacoesrelatorio, stub_model(SivicSituacoesrelatorio,
      :DESC_Situacao => "MyString"
    ).as_new_record)
  end

  it "renders new sivic_situacoesrelatorio form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_situacoesrelatorios_path, "post" do
      assert_select "input#sivic_situacoesrelatorio_DESC_Situacao[name=?]", "sivic_situacoesrelatorio[DESC_Situacao]"
    end
  end
end
