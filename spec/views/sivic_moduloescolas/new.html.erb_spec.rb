require 'spec_helper'

describe "sivic_moduloescolas/new" do
  before(:each) do
    assign(:sivic_moduloescola, stub_model(SivicModuloescola,
      :sivic_igreja => nil,
      :user => nil,
      :nome_modulo => "MyString"
    ).as_new_record)
  end

  it "renders new sivic_moduloescola form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_moduloescolas_path, "post" do
      assert_select "input#sivic_moduloescola_sivic_igreja[name=?]", "sivic_moduloescola[sivic_igreja]"
      assert_select "input#sivic_moduloescola_user[name=?]", "sivic_moduloescola[user]"
      assert_select "input#sivic_moduloescola_nome_modulo[name=?]", "sivic_moduloescola[nome_modulo]"
    end
  end
end
