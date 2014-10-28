require 'spec_helper'

describe "sivic_atividadepessoas/edit" do
  before(:each) do
    @sivic_atividadepessoa = assign(:sivic_atividadepessoa, stub_model(SivicAtividadepessoa,
      :flag_ativo => "",
      :sivic_atividade => nil,
      :sivic_igreja => nil,
      :sivic_pessoa => nil,
      :User => nil
    ))
  end

  it "renders the edit sivic_atividadepessoa form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_atividadepessoa_path(@sivic_atividadepessoa), "post" do
      assert_select "input#sivic_atividadepessoa_flag_ativo[name=?]", "sivic_atividadepessoa[flag_ativo]"
      assert_select "input#sivic_atividadepessoa_sivic_atividade[name=?]", "sivic_atividadepessoa[sivic_atividade]"
      assert_select "input#sivic_atividadepessoa_sivic_igreja[name=?]", "sivic_atividadepessoa[sivic_igreja]"
      assert_select "input#sivic_atividadepessoa_sivic_pessoa[name=?]", "sivic_atividadepessoa[sivic_pessoa]"
      assert_select "input#sivic_atividadepessoa_User[name=?]", "sivic_atividadepessoa[User]"
    end
  end
end
