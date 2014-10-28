require 'spec_helper'

describe "sivic_permissaos/index" do
  before(:each) do
    assign(:sivic_permissaos, [
      stub_model(SivicPermissao,
        :mome_model => "Mome Model",
        :mumr_acao => 1,
        :desc_permissao => "MyText"
      ),
      stub_model(SivicPermissao,
        :mome_model => "Mome Model",
        :mumr_acao => 1,
        :desc_permissao => "MyText"
      )
    ])
  end

  it "renders a list of sivic_permissaos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Mome Model".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
