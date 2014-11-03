require 'spec_helper'

describe "sivic_sitpartcelulas/show" do
  before(:each) do
    @sivic_sitpartcelula = assign(:sivic_sitpartcelula, stub_model(SivicSitpartcelula,
      :DESC_situacao => "Desc Situacao",
      :sivic_igreja => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Desc Situacao/)
    rendered.should match(//)
  end
end
