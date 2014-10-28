require 'spec_helper'

describe "sivic_inscricaos/show" do
  before(:each) do
    @sivic_inscricao = assign(:sivic_inscricao, stub_model(SivicInscricao,
      :nome_igreja => "Nome Igreja",
      :nome_pessoa => "Nome Pessoa",
      :desc_telefone => "Desc Telefone",
      :numg_cidade => 1,
      :desc_email => "Desc Email",
      :desc_senha => "Desc Senha",
      :desc_confirmasenha => "Desc Confirmasenha"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome Igreja/)
    rendered.should match(/Nome Pessoa/)
    rendered.should match(/Desc Telefone/)
    rendered.should match(/1/)
    rendered.should match(/Desc Email/)
    rendered.should match(/Desc Senha/)
    rendered.should match(/Desc Confirmasenha/)
  end
end
