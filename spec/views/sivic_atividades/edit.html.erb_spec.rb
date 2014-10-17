require 'spec_helper'

describe "sivic_atividades/edit" do
  before(:each) do
    @sivic_atividade = assign(:sivic_atividade, stub_model(SivicAtividade,
      :nome_atividade => "MyString",
      :desc_atividade => "MyString",
      :sivic_periodicidadeconso => nil,
      :sivic_igreja => nil,
      :User => nil
    ))
  end

  it "renders the edit sivic_atividade form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_atividade_path(@sivic_atividade), "post" do
      assert_select "input#sivic_atividade_nome_atividade[name=?]", "sivic_atividade[nome_atividade]"
      assert_select "input#sivic_atividade_desc_atividade[name=?]", "sivic_atividade[desc_atividade]"
      assert_select "input#sivic_atividade_sivic_periodicidadeconso[name=?]", "sivic_atividade[sivic_periodicidadeconso]"
      assert_select "input#sivic_atividade_sivic_igreja[name=?]", "sivic_atividade[sivic_igreja]"
      assert_select "input#sivic_atividade_User[name=?]", "sivic_atividade[User]"
    end
  end
end
