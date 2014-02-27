require 'spec_helper'

describe "observacoesrelatorios/edit" do
  before(:each) do
    @observacoesrelatorio = assign(:observacoesrelatorio, stub_model(Observacoesrelatorio,
      :sivic_relatorioscelulas => nil,
      :sivic_pessoas => nil,
      :DESC_Observacao => "MyString"
    ))
  end

  it "renders the edit observacoesrelatorio form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", observacoesrelatorio_path(@observacoesrelatorio), "post" do
      assert_select "input#observacoesrelatorio_sivic_relatorioscelulas[name=?]", "observacoesrelatorio[sivic_relatorioscelulas]"
      assert_select "input#observacoesrelatorio_sivic_pessoas[name=?]", "observacoesrelatorio[sivic_pessoas]"
      assert_select "input#observacoesrelatorio_DESC_Observacao[name=?]", "observacoesrelatorio[DESC_Observacao]"
    end
  end
end
