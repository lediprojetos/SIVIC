require 'spec_helper'

describe "sivic_tipo_eventos/edit" do
  before(:each) do
    @sivic_tipo_evento = assign(:sivic_tipo_evento, stub_model(SivicTipoEvento,
      :nome => "MyString",
      :igreja_id => 1
    ))
  end

  it "renders the edit sivic_tipo_evento form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_tipo_evento_path(@sivic_tipo_evento), "post" do
      assert_select "input#sivic_tipo_evento_nome[name=?]", "sivic_tipo_evento[nome]"
      assert_select "input#sivic_tipo_evento_igreja_id[name=?]", "sivic_tipo_evento[igreja_id]"
    end
  end
end
