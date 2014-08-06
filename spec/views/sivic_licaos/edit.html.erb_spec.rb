require 'spec_helper'

describe "sivic_licaos/edit" do
  before(:each) do
    @sivic_licao = assign(:sivic_licao, stub_model(SivicLicao,
      :nome_licao => "MyString",
      :user => nil,
      :sivic_igreja => nil,
      :sivic_turmamoduloprofessor => nil
    ))
  end

  it "renders the edit sivic_licao form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_licao_path(@sivic_licao), "post" do
      assert_select "input#sivic_licao_nome_licao[name=?]", "sivic_licao[nome_licao]"
      assert_select "input#sivic_licao_user[name=?]", "sivic_licao[user]"
      assert_select "input#sivic_licao_sivic_igreja[name=?]", "sivic_licao[sivic_igreja]"
      assert_select "input#sivic_licao_sivic_turmamoduloprofessor[name=?]", "sivic_licao[sivic_turmamoduloprofessor]"
    end
  end
end
