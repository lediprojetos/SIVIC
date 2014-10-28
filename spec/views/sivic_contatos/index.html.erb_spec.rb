require 'spec_helper'

describe "sivic_contatos/index" do
  before(:each) do
    assign(:sivic_contatos, [
      stub_model(SivicContato,
        :desc_nome => "Desc Nome",
        :desc_email => "Desc Email",
        :desc_assunto => "Desc Assunto",
        :desc_mensagem => "Desc Mensagem",
        :desc_ip => "Desc Ip"
      ),
      stub_model(SivicContato,
        :desc_nome => "Desc Nome",
        :desc_email => "Desc Email",
        :desc_assunto => "Desc Assunto",
        :desc_mensagem => "Desc Mensagem",
        :desc_ip => "Desc Ip"
      )
    ])
  end

  it "renders a list of sivic_contatos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Desc Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Desc Email".to_s, :count => 2
    assert_select "tr>td", :text => "Desc Assunto".to_s, :count => 2
    assert_select "tr>td", :text => "Desc Mensagem".to_s, :count => 2
    assert_select "tr>td", :text => "Desc Ip".to_s, :count => 2
  end
end
