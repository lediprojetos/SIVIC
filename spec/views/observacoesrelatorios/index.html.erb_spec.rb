require 'spec_helper'

describe "observacoesrelatorios/index" do
  before(:each) do
    assign(:observacoesrelatorios, [
      stub_model(Observacoesrelatorio,
        :sivic_relatorioscelulas => nil,
        :sivic_pessoas => nil,
        :DESC_Observacao => "Desc Observacao"
      ),
      stub_model(Observacoesrelatorio,
        :sivic_relatorioscelulas => nil,
        :sivic_pessoas => nil,
        :DESC_Observacao => "Desc Observacao"
      )
    ])
  end

  it "renders a list of observacoesrelatorios" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Desc Observacao".to_s, :count => 2
  end
end
