require 'spec_helper'

describe "sivic_contabancos/new" do
  before(:each) do
    assign(:sivic_contabanco, stub_model(SivicContabanco,
      :nome_conta => "MyString",
      :numr_agencia => "MyString",
      :numr_conta => "MyString",
      :numr_dvconta => "MyString",
      :sivic_banco => nil,
      :sivic_igreja => nil,
      :User => "",
      :User => nil
    ).as_new_record)
  end

  it "renders new sivic_contabanco form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_contabancos_path, "post" do
      assert_select "input#sivic_contabanco_nome_conta[name=?]", "sivic_contabanco[nome_conta]"
      assert_select "input#sivic_contabanco_numr_agencia[name=?]", "sivic_contabanco[numr_agencia]"
      assert_select "input#sivic_contabanco_numr_conta[name=?]", "sivic_contabanco[numr_conta]"
      assert_select "input#sivic_contabanco_numr_dvconta[name=?]", "sivic_contabanco[numr_dvconta]"
      assert_select "input#sivic_contabanco_sivic_banco[name=?]", "sivic_contabanco[sivic_banco]"
      assert_select "input#sivic_contabanco_sivic_igreja[name=?]", "sivic_contabanco[sivic_igreja]"
      assert_select "input#sivic_contabanco_User[name=?]", "sivic_contabanco[User]"
      assert_select "input#sivic_contabanco_User[name=?]", "sivic_contabanco[User]"
    end
  end
end
