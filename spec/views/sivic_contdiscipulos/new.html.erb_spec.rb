require 'spec_helper'

describe "sivic_contdiscipulos/new" do
  before(:each) do
    assign(:sivic_contdiscipulo, stub_model(SivicContdiscipulo,
      :NUMR_Contador => 1,
      :sivic_igreja => nil
    ).as_new_record)
  end

  it "renders new sivic_contdiscipulo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_contdiscipulos_path, "post" do
      assert_select "input#sivic_contdiscipulo_NUMR_Contador[name=?]", "sivic_contdiscipulo[NUMR_Contador]"
      assert_select "input#sivic_contdiscipulo_sivic_igreja[name=?]", "sivic_contdiscipulo[sivic_igreja]"
    end
  end
end
