require 'spec_helper'

describe "sivic_tipo_eventos/edit" do
  before(:each) do
    @sivic_tipo_evento = assign(:sivic_tipo_evento, stub_model(SivicTipoEvento,
      :desc_tipoevento => "MyString",
      :sivic_igreja => nil
    ))
  end

  it "renders the edit sivic_tipo_evento form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_tipo_evento_path(@sivic_tipo_evento), "post" do
      assert_select "input#sivic_tipo_evento_desc_tipoevento[name=?]", "sivic_tipo_evento[desc_tipoevento]"
      assert_select "input#sivic_tipo_evento_sivic_igreja[name=?]", "sivic_tipo_evento[sivic_igreja]"
    end
  end
end
