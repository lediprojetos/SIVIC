require 'spec_helper'

describe "sivic_contatos/show" do
  before(:each) do
    @sivic_contato = assign(:sivic_contato, stub_model(SivicContato,
      :desc_nome => "Desc Nome",
      :desc_email => "Desc Email",
      :desc_assunto => "Desc Assunto",
      :desc_mensagem => "Desc Mensagem",
      :desc_ip => "Desc Ip"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Desc Nome/)
    rendered.should match(/Desc Email/)
    rendered.should match(/Desc Assunto/)
    rendered.should match(/Desc Mensagem/)
    rendered.should match(/Desc Ip/)
  end
end
