require 'spec_helper'

describe "sivic_pessoas/edit" do
  before(:each) do
    @sivic_pessoa = assign(:sivic_pessoa, stub_model(SivicPessoa,
      :NOME_pessoa => "MyString",
      :DESC_email => "MyString",
      :DESC_observacao => "MyString",
      :sivic_igreja => nil,
      :User => nil
    ))
  end

  it "renders the edit sivic_pessoa form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_pessoa_path(@sivic_pessoa), "post" do
      assert_select "input#sivic_pessoa_NOME_pessoa[name=?]", "sivic_pessoa[NOME_pessoa]"
      assert_select "input#sivic_pessoa_DESC_email[name=?]", "sivic_pessoa[DESC_email]"
      assert_select "input#sivic_pessoa_DESC_observacao[name=?]", "sivic_pessoa[DESC_observacao]"
      assert_select "input#sivic_pessoa_sivic_igreja[name=?]", "sivic_pessoa[sivic_igreja]"
      assert_select "input#sivic_pessoa_User[name=?]", "sivic_pessoa[User]"
    end
  end
end
