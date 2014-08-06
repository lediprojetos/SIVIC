require 'spec_helper'

describe "sivic_licaos/new" do
  before(:each) do
    assign(:sivic_licao, stub_model(SivicLicao,
      :nome_licao => "MyString",
      :user => nil,
      :sivic_igreja => nil,
      :sivic_turmamoduloprofessor => nil
    ).as_new_record)
  end

  it "renders new sivic_licao form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_licaos_path, "post" do
      assert_select "input#sivic_licao_nome_licao[name=?]", "sivic_licao[nome_licao]"
      assert_select "input#sivic_licao_user[name=?]", "sivic_licao[user]"
      assert_select "input#sivic_licao_sivic_igreja[name=?]", "sivic_licao[sivic_igreja]"
      assert_select "input#sivic_licao_sivic_turmamoduloprofessor[name=?]", "sivic_licao[sivic_turmamoduloprofessor]"
    end
  end
end
