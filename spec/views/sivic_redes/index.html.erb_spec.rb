require 'spec_helper'

describe "sivic_redes/index" do
  before(:each) do
    assign(:sivic_redes, [
      stub_model(SivicRede,
        :nome_rede => "Nome Rede",
        :sivic_igreja => nil
      ),
      stub_model(SivicRede,
        :nome_rede => "Nome Rede",
        :sivic_igreja => nil
      )
    ])
  end

  it "renders a list of sivic_redes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome Rede".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
