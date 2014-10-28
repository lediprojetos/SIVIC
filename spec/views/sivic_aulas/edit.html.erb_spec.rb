require 'spec_helper'

describe "sivic_aulas/edit" do
  before(:each) do
    @sivic_aula = assign(:sivic_aula, stub_model(SivicAula,
      :nome_aula => "MyString",
      :user => nil,
      :sivic_igreja => nil,
      :sivic_tumamoduloprofessor => nil
    ))
  end

  it "renders the edit sivic_aula form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_aula_path(@sivic_aula), "post" do
      assert_select "input#sivic_aula_nome_aula[name=?]", "sivic_aula[nome_aula]"
      assert_select "input#sivic_aula_user[name=?]", "sivic_aula[user]"
      assert_select "input#sivic_aula_sivic_igreja[name=?]", "sivic_aula[sivic_igreja]"
      assert_select "input#sivic_aula_sivic_tumamoduloprofessor[name=?]", "sivic_aula[sivic_tumamoduloprofessor]"
    end
  end
end
