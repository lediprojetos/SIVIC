require 'spec_helper'

describe "sivic_ministeriodiscipulos/edit" do
  before(:each) do
    @sivic_ministeriodiscipulo = assign(:sivic_ministeriodiscipulo, stub_model(SivicMinisteriodiscipulo,
      :sivic_discipulo => nil,
      :sivic_ministerio => nil,
      :flag_ministerioativo => false
    ))
  end

  it "renders the edit sivic_ministeriodiscipulo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_ministeriodiscipulo_path(@sivic_ministeriodiscipulo), "post" do
      assert_select "input#sivic_ministeriodiscipulo_sivic_discipulo[name=?]", "sivic_ministeriodiscipulo[sivic_discipulo]"
      assert_select "input#sivic_ministeriodiscipulo_sivic_ministerio[name=?]", "sivic_ministeriodiscipulo[sivic_ministerio]"
      assert_select "input#sivic_ministeriodiscipulo_flag_ministerioativo[name=?]", "sivic_ministeriodiscipulo[flag_ministerioativo]"
    end
  end
end
