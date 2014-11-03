require 'spec_helper'

describe "sivic_ministerios/edit" do
  before(:each) do
    @sivic_ministerio = assign(:sivic_ministerio, stub_model(SivicMinisterio,
      :nome_ministerio => "MyString",
      :sigl_ministerio => "MyString",
      :sivic_igreja => nil
    ))
  end

  it "renders the edit sivic_ministerio form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_ministerio_path(@sivic_ministerio), "post" do
      assert_select "input#sivic_ministerio_nome_ministerio[name=?]", "sivic_ministerio[nome_ministerio]"
      assert_select "input#sivic_ministerio_sigl_ministerio[name=?]", "sivic_ministerio[sigl_ministerio]"
      assert_select "input#sivic_ministerio_sivic_igreja[name=?]", "sivic_ministerio[sivic_igreja]"
    end
  end
end
