require 'spec_helper'

describe "sivic_userpermissaos/new" do
  before(:each) do
    assign(:sivic_userpermissao, stub_model(SivicUserpermissao,
      :sivic_permissao => nil,
      :user => nil
    ).as_new_record)
  end

  it "renders new sivic_userpermissao form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_userpermissaos_path, "post" do
      assert_select "input#sivic_userpermissao_sivic_permissao[name=?]", "sivic_userpermissao[sivic_permissao]"
      assert_select "input#sivic_userpermissao_user[name=?]", "sivic_userpermissao[user]"
    end
  end
end
