require 'spec_helper'

describe "sivic_igrejas/new" do
  before(:each) do
    assign(:sivic_igreja, stub_model(SivicIgreja,
      :nome => "MyString",
      :igrejaSede_id => 1,
      :endereco_id => 1
    ).as_new_record)
  end

  it "renders new sivic_igreja form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_igrejas_path, "post" do
      assert_select "input#sivic_igreja_nome[name=?]", "sivic_igreja[nome]"
      assert_select "input#sivic_igreja_igrejaSede_id[name=?]", "sivic_igreja[igrejaSede_id]"
      assert_select "input#sivic_igreja_endereco_id[name=?]", "sivic_igreja[endereco_id]"
    end
  end
end
