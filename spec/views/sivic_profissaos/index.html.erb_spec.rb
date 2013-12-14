require 'spec_helper'

describe "sivic_profissaos/index" do
  before(:each) do
    assign(:sivic_profissaos, [
      stub_model(SivicProfissao,
        :profissao => "Profissao"
      ),
      stub_model(SivicProfissao,
        :profissao => "Profissao"
      )
    ])
  end

  it "renders a list of sivic_profissaos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Profissao".to_s, :count => 2
  end
end
