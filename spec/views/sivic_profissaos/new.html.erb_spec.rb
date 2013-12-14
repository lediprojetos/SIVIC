require 'spec_helper'

describe "sivic_profissaos/new" do
  before(:each) do
    assign(:sivic_profissao, stub_model(SivicProfissao,
      :profissao => "MyString"
    ).as_new_record)
  end

  it "renders new sivic_profissao form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_profissaos_path, "post" do
      assert_select "input#sivic_profissao_profissao[name=?]", "sivic_profissao[profissao]"
    end
  end
end
