require 'spec_helper'

describe "sivic_ministerios/new" do
  before(:each) do
    assign(:sivic_ministerio, stub_model(SivicMinisterio,
      :nome_ministerio => "MyString",
      :sigl_ministerio => "MyString",
      :sivic_igreja => nil
    ).as_new_record)
  end

  it "renders new sivic_ministerio form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_ministerios_path, "post" do
      assert_select "input#sivic_ministerio_nome_ministerio[name=?]", "sivic_ministerio[nome_ministerio]"
      assert_select "input#sivic_ministerio_sigl_ministerio[name=?]", "sivic_ministerio[sigl_ministerio]"
      assert_select "input#sivic_ministerio_sivic_igreja[name=?]", "sivic_ministerio[sivic_igreja]"
    end
  end
end
