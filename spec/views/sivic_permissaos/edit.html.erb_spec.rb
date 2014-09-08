require 'spec_helper'

describe "sivic_permissaos/edit" do
  before(:each) do
    @sivic_permissao = assign(:sivic_permissao, stub_model(SivicPermissao,
      :mome_model => "MyString",
      :mumr_acao => 1,
      :desc_permissao => "MyText"
    ))
  end

  it "renders the edit sivic_permissao form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_permissao_path(@sivic_permissao), "post" do
      assert_select "input#sivic_permissao_mome_model[name=?]", "sivic_permissao[mome_model]"
      assert_select "input#sivic_permissao_mumr_acao[name=?]", "sivic_permissao[mumr_acao]"
      assert_select "textarea#sivic_permissao_desc_permissao[name=?]", "sivic_permissao[desc_permissao]"
    end
  end
end
