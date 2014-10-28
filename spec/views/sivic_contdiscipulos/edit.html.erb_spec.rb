require 'spec_helper'

describe "sivic_contdiscipulos/edit" do
  before(:each) do
    @sivic_contdiscipulo = assign(:sivic_contdiscipulo, stub_model(SivicContdiscipulo,
      :NUMR_Contador => 1,
      :sivic_igreja => nil
    ))
  end

  it "renders the edit sivic_contdiscipulo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_contdiscipulo_path(@sivic_contdiscipulo), "post" do
      assert_select "input#sivic_contdiscipulo_NUMR_Contador[name=?]", "sivic_contdiscipulo[NUMR_Contador]"
      assert_select "input#sivic_contdiscipulo_sivic_igreja[name=?]", "sivic_contdiscipulo[sivic_igreja]"
    end
  end
end
