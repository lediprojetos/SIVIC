require 'spec_helper'

describe "sivic_fechamentos/edit" do
  before(:each) do
    @sivic_fechamento = assign(:sivic_fechamento, stub_model(SivicFechamento,
      :sivic_igreja => nil,
      :desc_fechamento => "MyString",
      :valr_fechamento => "9.99",
      :tipo_fechamento => 1,
      :User => nil
    ))
  end

  it "renders the edit sivic_fechamento form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_fechamento_path(@sivic_fechamento), "post" do
      assert_select "input#sivic_fechamento_sivic_igreja[name=?]", "sivic_fechamento[sivic_igreja]"
      assert_select "input#sivic_fechamento_desc_fechamento[name=?]", "sivic_fechamento[desc_fechamento]"
      assert_select "input#sivic_fechamento_valr_fechamento[name=?]", "sivic_fechamento[valr_fechamento]"
      assert_select "input#sivic_fechamento_tipo_fechamento[name=?]", "sivic_fechamento[tipo_fechamento]"
      assert_select "input#sivic_fechamento_User[name=?]", "sivic_fechamento[User]"
    end
  end
end
