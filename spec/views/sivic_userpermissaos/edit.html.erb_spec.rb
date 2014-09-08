require 'spec_helper'

describe "sivic_userpermissaos/edit" do
  before(:each) do
    @sivic_userpermissao = assign(:sivic_userpermissao, stub_model(SivicUserpermissao,
      :sivic_permissao => nil,
      :user => nil
    ))
  end

  it "renders the edit sivic_userpermissao form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_userpermissao_path(@sivic_userpermissao), "post" do
      assert_select "input#sivic_userpermissao_sivic_permissao[name=?]", "sivic_userpermissao[sivic_permissao]"
      assert_select "input#sivic_userpermissao_user[name=?]", "sivic_userpermissao[user]"
    end
  end
end
