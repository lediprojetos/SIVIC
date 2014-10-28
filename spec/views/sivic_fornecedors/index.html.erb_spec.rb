require 'spec_helper'

describe "sivic_fornecedors/index" do
  before(:each) do
    assign(:sivic_fornecedors, [
      stub_model(SivicFornecedor,
        :nome_fornecedor => "Nome Fornecedor",
        :numr_cnpj => "Numr Cnpj",
        :numr_cpf => "Numr Cpf",
        :numr_telefone => "Numr Telefone",
        :nome_responsavel => "Nome Responsavel",
        :desc_fornecedor => "Desc Fornecedor",
        :sivic_endereco => nil,
        :sivic_igreja => nil,
        :user => nil
      ),
      stub_model(SivicFornecedor,
        :nome_fornecedor => "Nome Fornecedor",
        :numr_cnpj => "Numr Cnpj",
        :numr_cpf => "Numr Cpf",
        :numr_telefone => "Numr Telefone",
        :nome_responsavel => "Nome Responsavel",
        :desc_fornecedor => "Desc Fornecedor",
        :sivic_endereco => nil,
        :sivic_igreja => nil,
        :user => nil
      )
    ])
  end

  it "renders a list of sivic_fornecedors" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome Fornecedor".to_s, :count => 2
    assert_select "tr>td", :text => "Numr Cnpj".to_s, :count => 2
    assert_select "tr>td", :text => "Numr Cpf".to_s, :count => 2
    assert_select "tr>td", :text => "Numr Telefone".to_s, :count => 2
    assert_select "tr>td", :text => "Nome Responsavel".to_s, :count => 2
    assert_select "tr>td", :text => "Desc Fornecedor".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
