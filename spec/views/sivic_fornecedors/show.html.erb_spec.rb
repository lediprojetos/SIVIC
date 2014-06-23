require 'spec_helper'

describe "sivic_fornecedors/show" do
  before(:each) do
    @sivic_fornecedor = assign(:sivic_fornecedor, stub_model(SivicFornecedor,
      :nome_fornecedor => "Nome Fornecedor",
      :numr_cnpj => "Numr Cnpj",
      :numr_cpf => "Numr Cpf",
      :numr_telefone => "Numr Telefone",
      :nome_responsavel => "Nome Responsavel",
      :desc_fornecedor => "Desc Fornecedor",
      :sivic_endereco => nil,
      :sivic_igreja => nil,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome Fornecedor/)
    rendered.should match(/Numr Cnpj/)
    rendered.should match(/Numr Cpf/)
    rendered.should match(/Numr Telefone/)
    rendered.should match(/Nome Responsavel/)
    rendered.should match(/Desc Fornecedor/)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
  end
end
