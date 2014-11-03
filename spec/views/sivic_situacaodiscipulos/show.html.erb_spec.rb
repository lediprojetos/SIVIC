require 'spec_helper'

describe "sivic_situacaodiscipulos/show" do
  before(:each) do
    @sivic_situacaodiscipulo = assign(:sivic_situacaodiscipulo, stub_model(SivicSituacaodiscipulo,
      :sivic_igrejas => nil,
      :user => nil,
      :user => nil,
      :nome_situacao => "Nome Situacao"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/Nome Situacao/)
  end
end
