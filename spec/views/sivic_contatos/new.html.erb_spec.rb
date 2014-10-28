require 'spec_helper'

describe "sivic_contatos/new" do
  before(:each) do
    assign(:sivic_contato, stub_model(SivicContato,
      :desc_nome => "MyString",
      :desc_email => "MyString",
      :desc_assunto => "MyString",
      :desc_mensagem => "MyString",
      :desc_ip => "MyString"
    ).as_new_record)
  end

  it "renders new sivic_contato form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_contatos_path, "post" do
      assert_select "input#sivic_contato_desc_nome[name=?]", "sivic_contato[desc_nome]"
      assert_select "input#sivic_contato_desc_email[name=?]", "sivic_contato[desc_email]"
      assert_select "input#sivic_contato_desc_assunto[name=?]", "sivic_contato[desc_assunto]"
      assert_select "input#sivic_contato_desc_mensagem[name=?]", "sivic_contato[desc_mensagem]"
      assert_select "input#sivic_contato_desc_ip[name=?]", "sivic_contato[desc_ip]"
    end
  end
end
