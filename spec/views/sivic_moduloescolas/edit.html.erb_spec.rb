require 'spec_helper'

describe "sivic_moduloescolas/edit" do
  before(:each) do
    @sivic_moduloescola = assign(:sivic_moduloescola, stub_model(SivicModuloescola,
      :sivic_igreja => nil,
      :user => nil,
      :nome_modulo => "MyString"
    ))
  end

  it "renders the edit sivic_moduloescola form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_moduloescola_path(@sivic_moduloescola), "post" do
      assert_select "input#sivic_moduloescola_sivic_igreja[name=?]", "sivic_moduloescola[sivic_igreja]"
      assert_select "input#sivic_moduloescola_user[name=?]", "sivic_moduloescola[user]"
      assert_select "input#sivic_moduloescola_nome_modulo[name=?]", "sivic_moduloescola[nome_modulo]"
    end
  end
end
