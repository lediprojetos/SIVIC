require 'spec_helper'

describe "sivic_situacaodiscipulos/index" do
  before(:each) do
    assign(:sivic_situacaodiscipulos, [
      stub_model(SivicSituacaodiscipulo,
        :sivic_igrejas => nil,
        :user => nil,
        :user => nil,
        :nome_situacao => "Nome Situacao"
      ),
      stub_model(SivicSituacaodiscipulo,
        :sivic_igrejas => nil,
        :user => nil,
        :user => nil,
        :nome_situacao => "Nome Situacao"
      )
    ])
  end

  it "renders a list of sivic_situacaodiscipulos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Nome Situacao".to_s, :count => 2
  end
end
