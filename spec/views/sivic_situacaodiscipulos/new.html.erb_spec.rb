require 'spec_helper'

describe "sivic_situacaodiscipulos/new" do
  before(:each) do
    assign(:sivic_situacaodiscipulo, stub_model(SivicSituacaodiscipulo,
      :sivic_igrejas => nil,
      :user => nil,
      :user => nil,
      :nome_situacao => "MyString"
    ).as_new_record)
  end

  it "renders new sivic_situacaodiscipulo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_situacaodiscipulos_path, "post" do
      assert_select "input#sivic_situacaodiscipulo_sivic_igrejas[name=?]", "sivic_situacaodiscipulo[sivic_igrejas]"
      assert_select "input#sivic_situacaodiscipulo_user[name=?]", "sivic_situacaodiscipulo[user]"
      assert_select "input#sivic_situacaodiscipulo_user[name=?]", "sivic_situacaodiscipulo[user]"
      assert_select "input#sivic_situacaodiscipulo_nome_situacao[name=?]", "sivic_situacaodiscipulo[nome_situacao]"
    end
  end
end
