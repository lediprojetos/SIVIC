require 'spec_helper'

describe "sivic_contcelulas/new" do
  before(:each) do
    assign(:sivic_contcelula, stub_model(SivicContcelula,
      :NUMR_Contador => 1,
      :sivic_igreja => nil
    ).as_new_record)
  end

  it "renders new sivic_contcelula form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_contcelulas_path, "post" do
      assert_select "input#sivic_contcelula_NUMR_Contador[name=?]", "sivic_contcelula[NUMR_Contador]"
      assert_select "input#sivic_contcelula_sivic_igreja[name=?]", "sivic_contcelula[sivic_igreja]"
    end
  end
end
