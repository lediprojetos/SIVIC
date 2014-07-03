require 'spec_helper'

describe "sivic_centrocustos/show" do
  before(:each) do
    @sivic_centrocusto = assign(:sivic_centrocusto, stub_model(SivicCentrocusto,
      :nome_centrocusto => "Nome Centrocusto",
      :desc_centrocusto => "MyText",
      :user => nil,
      :sivic_igreja => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome Centrocusto/)
    rendered.should match(/MyText/)
    rendered.should match(//)
    rendered.should match(//)
  end
end
