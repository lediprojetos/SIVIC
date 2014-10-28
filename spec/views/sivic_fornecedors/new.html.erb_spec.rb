require 'spec_helper'

describe "sivic_fornecedors/new" do
  before(:each) do
    assign(:sivic_fornecedor, stub_model(SivicFornecedor,
      :nome_fornecedor => "MyString",
      :numr_cnpj => "MyString",
      :numr_cpf => "MyString",
      :numr_telefone => "MyString",
      :nome_responsavel => "MyString",
      :desc_fornecedor => "MyString",
      :sivic_endereco => nil,
      :sivic_igreja => nil,
      :user => nil
    ).as_new_record)
  end

  it "renders new sivic_fornecedor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_fornecedors_path, "post" do
      assert_select "input#sivic_fornecedor_nome_fornecedor[name=?]", "sivic_fornecedor[nome_fornecedor]"
      assert_select "input#sivic_fornecedor_numr_cnpj[name=?]", "sivic_fornecedor[numr_cnpj]"
      assert_select "input#sivic_fornecedor_numr_cpf[name=?]", "sivic_fornecedor[numr_cpf]"
      assert_select "input#sivic_fornecedor_numr_telefone[name=?]", "sivic_fornecedor[numr_telefone]"
      assert_select "input#sivic_fornecedor_nome_responsavel[name=?]", "sivic_fornecedor[nome_responsavel]"
      assert_select "input#sivic_fornecedor_desc_fornecedor[name=?]", "sivic_fornecedor[desc_fornecedor]"
      assert_select "input#sivic_fornecedor_sivic_endereco[name=?]", "sivic_fornecedor[sivic_endereco]"
      assert_select "input#sivic_fornecedor_sivic_igreja[name=?]", "sivic_fornecedor[sivic_igreja]"
      assert_select "input#sivic_fornecedor_user[name=?]", "sivic_fornecedor[user]"
    end
  end
end
