require 'spec_helper'

describe "observacoesrelatorios/show" do
  before(:each) do
    @observacoesrelatorio = assign(:observacoesrelatorio, stub_model(Observacoesrelatorio,
      :sivic_relatorioscelulas => nil,
      :sivic_pessoas => nil,
      :DESC_Observacao => "Desc Observacao"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/Desc Observacao/)
  end
end
