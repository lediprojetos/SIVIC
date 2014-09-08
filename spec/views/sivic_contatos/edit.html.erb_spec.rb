require 'spec_helper'

describe "sivic_contatos/edit" do
  before(:each) do
    @sivic_contato = assign(:sivic_contato, stub_model(SivicContato,
      :desc_nome => "MyString",
      :desc_email => "MyString",
      :desc_assunto => "MyString",
      :desc_mensagem => "MyString",
      :desc_ip => "MyString"
    ))
  end

  it "renders the edit sivic_contato form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_contato_path(@sivic_contato), "post" do
      assert_select "input#sivic_contato_desc_nome[name=?]", "sivic_contato[desc_nome]"
      assert_select "input#sivic_contato_desc_email[name=?]", "sivic_contato[desc_email]"
      assert_select "input#sivic_contato_desc_assunto[name=?]", "sivic_contato[desc_assunto]"
      assert_select "input#sivic_contato_desc_mensagem[name=?]", "sivic_contato[desc_mensagem]"
      assert_select "input#sivic_contato_desc_ip[name=?]", "sivic_contato[desc_ip]"
    end
  end
end
