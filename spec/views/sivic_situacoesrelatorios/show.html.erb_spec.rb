require 'spec_helper'

describe "sivic_situacoesrelatorios/show" do
  before(:each) do
    @sivic_situacoesrelatorio = assign(:sivic_situacoesrelatorio, stub_model(SivicSituacoesrelatorio,
      :DESC_Situacao => "Desc Situacao"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Desc Situacao/)
  end
end
