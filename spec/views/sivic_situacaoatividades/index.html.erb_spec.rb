require 'spec_helper'

describe "sivic_situacaoatividades/index" do
  before(:each) do
    assign(:sivic_situacaoatividades, [
      stub_model(SivicSituacaoatividade,
        :nome => "Nome"
      ),
      stub_model(SivicSituacaoatividade,
        :nome => "Nome"
      )
    ])
  end

  it "renders a list of sivic_situacaoatividades" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
  end
end
