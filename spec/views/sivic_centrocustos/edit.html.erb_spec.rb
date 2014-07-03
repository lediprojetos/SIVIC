require 'spec_helper'

describe "sivic_centrocustos/edit" do
  before(:each) do
    @sivic_centrocusto = assign(:sivic_centrocusto, stub_model(SivicCentrocusto,
      :nome_centrocusto => "MyString",
      :desc_centrocusto => "MyText",
      :user => nil,
      :sivic_igreja => nil
    ))
  end

  it "renders the edit sivic_centrocusto form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_centrocusto_path(@sivic_centrocusto), "post" do
      assert_select "input#sivic_centrocusto_nome_centrocusto[name=?]", "sivic_centrocusto[nome_centrocusto]"
      assert_select "textarea#sivic_centrocusto_desc_centrocusto[name=?]", "sivic_centrocusto[desc_centrocusto]"
      assert_select "input#sivic_centrocusto_user[name=?]", "sivic_centrocusto[user]"
      assert_select "input#sivic_centrocusto_sivic_igreja[name=?]", "sivic_centrocusto[sivic_igreja]"
    end
  end
end
