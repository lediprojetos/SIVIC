require 'spec_helper'

describe "sivic_profissaos/edit" do
  before(:each) do
    @sivic_profissao = assign(:sivic_profissao, stub_model(SivicProfissao,
      :profissao => "MyString"
    ))
  end

  it "renders the edit sivic_profissao form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_profissao_path(@sivic_profissao), "post" do
      assert_select "input#sivic_profissao_profissao[name=?]", "sivic_profissao[profissao]"
    end
  end
end
