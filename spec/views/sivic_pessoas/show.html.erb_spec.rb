require 'spec_helper'

describe "sivic_pessoas/show" do
  before(:each) do
    @sivic_pessoa = assign(:sivic_pessoa, stub_model(SivicPessoa,
      :NOME_pessoa => "Nome Pessoa",
      :DESC_email => "Desc Email",
      :DESC_observacao => "Desc Observacao",
      :sivic_igreja => nil,
      :User => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome Pessoa/)
    rendered.should match(/Desc Email/)
    rendered.should match(/Desc Observacao/)
    rendered.should match(//)
    rendered.should match(//)
  end
end
