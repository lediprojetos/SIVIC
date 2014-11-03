require 'spec_helper'

describe "sivic_centrocustos/index" do
  before(:each) do
    assign(:sivic_centrocustos, [
      stub_model(SivicCentrocusto,
        :nome_centrocusto => "Nome Centrocusto",
        :desc_centrocusto => "MyText",
        :user => nil,
        :sivic_igreja => nil
      ),
      stub_model(SivicCentrocusto,
        :nome_centrocusto => "Nome Centrocusto",
        :desc_centrocusto => "MyText",
        :user => nil,
        :sivic_igreja => nil
      )
    ])
  end

  it "renders a list of sivic_centrocustos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome Centrocusto".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
