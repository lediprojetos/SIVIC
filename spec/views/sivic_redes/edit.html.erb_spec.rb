require 'spec_helper'

describe "sivic_redes/edit" do
  before(:each) do
    @sivic_rede = assign(:sivic_rede, stub_model(SivicRede,
      :nome_rede => "MyString",
      :sivic_igreja => nil
    ))
  end

  it "renders the edit sivic_rede form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_rede_path(@sivic_rede), "post" do
      assert_select "input#sivic_rede_nome_rede[name=?]", "sivic_rede[nome_rede]"
      assert_select "input#sivic_rede_sivic_igreja[name=?]", "sivic_rede[sivic_igreja]"
    end
  end
end
