require 'spec_helper'

describe "sivic_situacaodiscipulos/edit" do
  before(:each) do
    @sivic_situacaodiscipulo = assign(:sivic_situacaodiscipulo, stub_model(SivicSituacaodiscipulo,
      :sivic_igrejas => nil,
      :user => nil,
      :user => nil,
      :nome_situacao => "MyString"
    ))
  end

  it "renders the edit sivic_situacaodiscipulo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_situacaodiscipulo_path(@sivic_situacaodiscipulo), "post" do
      assert_select "input#sivic_situacaodiscipulo_sivic_igrejas[name=?]", "sivic_situacaodiscipulo[sivic_igrejas]"
      assert_select "input#sivic_situacaodiscipulo_user[name=?]", "sivic_situacaodiscipulo[user]"
      assert_select "input#sivic_situacaodiscipulo_user[name=?]", "sivic_situacaodiscipulo[user]"
      assert_select "input#sivic_situacaodiscipulo_nome_situacao[name=?]", "sivic_situacaodiscipulo[nome_situacao]"
    end
  end
end
