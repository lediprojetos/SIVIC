require 'spec_helper'

describe "sivic_muduloescolas/edit" do
  before(:each) do
    @sivic_muduloescola = assign(:sivic_muduloescola, stub_model(SivicMuduloescola,
      :sivic_igreja => nil,
      :user => nil,
      :nome_modulo => ""
    ))
  end

  it "renders the edit sivic_muduloescola form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_muduloescola_path(@sivic_muduloescola), "post" do
      assert_select "input#sivic_muduloescola_sivic_igreja[name=?]", "sivic_muduloescola[sivic_igreja]"
      assert_select "input#sivic_muduloescola_user[name=?]", "sivic_muduloescola[user]"
      assert_select "input#sivic_muduloescola_nome_modulo[name=?]", "sivic_muduloescola[nome_modulo]"
    end
  end
end
