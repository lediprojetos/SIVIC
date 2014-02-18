require 'spec_helper'

describe "sivic_sitpartcelulas/edit" do
  before(:each) do
    @sivic_sitpartcelula = assign(:sivic_sitpartcelula, stub_model(SivicSitpartcelula,
      :DESC_situacao => "MyString",
      :sivic_igreja => nil
    ))
  end

  it "renders the edit sivic_sitpartcelula form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_sitpartcelula_path(@sivic_sitpartcelula), "post" do
      assert_select "input#sivic_sitpartcelula_DESC_situacao[name=?]", "sivic_sitpartcelula[DESC_situacao]"
      assert_select "input#sivic_sitpartcelula_sivic_igreja[name=?]", "sivic_sitpartcelula[sivic_igreja]"
    end
  end
end
