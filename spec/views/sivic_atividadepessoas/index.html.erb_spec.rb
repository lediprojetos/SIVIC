require 'spec_helper'

describe "sivic_atividadepessoas/index" do
  before(:each) do
    assign(:sivic_atividadepessoas, [
      stub_model(SivicAtividadepessoa,
        :flag_ativo => "",
        :sivic_atividade => nil,
        :sivic_igreja => nil,
        :sivic_pessoa => nil,
        :User => nil
      ),
      stub_model(SivicAtividadepessoa,
        :flag_ativo => "",
        :sivic_atividade => nil,
        :sivic_igreja => nil,
        :sivic_pessoa => nil,
        :User => nil
      )
    ])
  end

  it "renders a list of sivic_atividadepessoas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
