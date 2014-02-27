require 'spec_helper'

describe "sivic_situacoesrelatorios/index" do
  before(:each) do
    assign(:sivic_situacoesrelatorios, [
      stub_model(SivicSituacoesrelatorio,
        :DESC_Situacao => "Desc Situacao"
      ),
      stub_model(SivicSituacoesrelatorio,
        :DESC_Situacao => "Desc Situacao"
      )
    ])
  end

  it "renders a list of sivic_situacoesrelatorios" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Desc Situacao".to_s, :count => 2
  end
end
