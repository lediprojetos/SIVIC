require 'spec_helper'

describe "sivic_moduloturmas/new" do
  before(:each) do
    assign(:sivic_moduloturma, stub_model(SivicModuloturma,
      :sivic_moduloescola => nil,
      :sivic_turma => nil
    ).as_new_record)
  end

  it "renders new sivic_moduloturma form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_moduloturmas_path, "post" do
      assert_select "input#sivic_moduloturma_sivic_moduloescola[name=?]", "sivic_moduloturma[sivic_moduloescola]"
      assert_select "input#sivic_moduloturma_sivic_turma[name=?]", "sivic_moduloturma[sivic_turma]"
    end
  end
end
