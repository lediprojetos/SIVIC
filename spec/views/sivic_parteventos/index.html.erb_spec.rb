require 'spec_helper'

describe "sivic_parteventos/index" do
  before(:each) do
    assign(:sivic_parteventos, [
      stub_model(SivicPartevento,
        :sivic_pessoa => nil,
        :sivic_evento => nil,
        :sivic_movimentofinanceiro => nil,
        :FLAG_naoparticipou => false
      ),
      stub_model(SivicPartevento,
        :sivic_pessoa => nil,
        :sivic_evento => nil,
        :sivic_movimentofinanceiro => nil,
        :FLAG_naoparticipou => false
      )
    ])
  end

  it "renders a list of sivic_parteventos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
