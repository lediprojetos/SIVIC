require 'spec_helper'

describe "sivic_moduloturmas/edit" do
  before(:each) do
    @sivic_moduloturma = assign(:sivic_moduloturma, stub_model(SivicModuloturma,
      :sivic_moduloescola => nil,
      :sivic_turma => nil
    ))
  end

  it "renders the edit sivic_moduloturma form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_moduloturma_path(@sivic_moduloturma), "post" do
      assert_select "input#sivic_moduloturma_sivic_moduloescola[name=?]", "sivic_moduloturma[sivic_moduloescola]"
      assert_select "input#sivic_moduloturma_sivic_turma[name=?]", "sivic_moduloturma[sivic_turma]"
    end
  end
end
