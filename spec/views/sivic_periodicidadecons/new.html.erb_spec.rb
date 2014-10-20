require 'spec_helper'

describe "sivic_periodicidadecons/new" do
  before(:each) do
    assign(:sivic_periodicidadecon, stub_model(SivicPeriodicidadecon,
      :desc_periodicidade => "MyString",
      :numr_qtddia => 1,
      :sivic_igreja => nil
    ).as_new_record)
  end

  it "renders new sivic_periodicidadecon form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_periodicidadecons_path, "post" do
      assert_select "input#sivic_periodicidadecon_desc_periodicidade[name=?]", "sivic_periodicidadecon[desc_periodicidade]"
      assert_select "input#sivic_periodicidadecon_numr_qtddia[name=?]", "sivic_periodicidadecon[numr_qtddia]"
      assert_select "input#sivic_periodicidadecon_sivic_igreja[name=?]", "sivic_periodicidadecon[sivic_igreja]"
    end
  end
end
