require 'spec_helper'

describe "sivic_redes/new" do
  before(:each) do
    assign(:sivic_rede, stub_model(SivicRede,
      :nome_rede => "MyString",
      :sivic_igreja => nil
    ).as_new_record)
  end

  it "renders new sivic_rede form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_redes_path, "post" do
      assert_select "input#sivic_rede_nome_rede[name=?]", "sivic_rede[nome_rede]"
      assert_select "input#sivic_rede_sivic_igreja[name=?]", "sivic_rede[sivic_igreja]"
    end
  end
end
