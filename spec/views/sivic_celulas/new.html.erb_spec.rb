require 'spec_helper'

describe "sivic_celulas/new" do
  before(:each) do
    assign(:sivic_celula, stub_model(SivicCelula,
      :sivic_pessoa => nil,
      :sivic_endereco => nil,
      :NUMR_Dia => 1
    ).as_new_record)
  end

  it "renders new sivic_celula form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_celulas_path, "post" do
      assert_select "input#sivic_celula_sivic_pessoa[name=?]", "sivic_celula[sivic_pessoa]"
      assert_select "input#sivic_celula_sivic_endereco[name=?]", "sivic_celula[sivic_endereco]"
      assert_select "input#sivic_celula_NUMR_Dia[name=?]", "sivic_celula[NUMR_Dia]"
    end
  end
end
