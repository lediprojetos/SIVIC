require 'spec_helper'

describe "sivic_ministeriodiscipulos/new" do
  before(:each) do
    assign(:sivic_ministeriodiscipulo, stub_model(SivicMinisteriodiscipulo,
      :sivic_discipulo => nil,
      :sivic_ministerio => nil,
      :flag_ministerioativo => false
    ).as_new_record)
  end

  it "renders new sivic_ministeriodiscipulo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_ministeriodiscipulos_path, "post" do
      assert_select "input#sivic_ministeriodiscipulo_sivic_discipulo[name=?]", "sivic_ministeriodiscipulo[sivic_discipulo]"
      assert_select "input#sivic_ministeriodiscipulo_sivic_ministerio[name=?]", "sivic_ministeriodiscipulo[sivic_ministerio]"
      assert_select "input#sivic_ministeriodiscipulo_flag_ministerioativo[name=?]", "sivic_ministeriodiscipulo[flag_ministerioativo]"
    end
  end
end
