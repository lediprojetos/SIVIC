require 'spec_helper'

describe "sivic_igrejas/edit" do
  before(:each) do
    @sivic_igreja = assign(:sivic_igreja, stub_model(SivicIgreja,
      :nome => "MyString",
      :igrejaSede_id => 1,
      :endereco_id => 1
    ))
  end

  it "renders the edit sivic_igreja form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_igreja_path(@sivic_igreja), "post" do
      assert_select "input#sivic_igreja_nome[name=?]", "sivic_igreja[nome]"
      assert_select "input#sivic_igreja_igrejaSede_id[name=?]", "sivic_igreja[igrejaSede_id]"
      assert_select "input#sivic_igreja_endereco_id[name=?]", "sivic_igreja[endereco_id]"
    end
  end
end
